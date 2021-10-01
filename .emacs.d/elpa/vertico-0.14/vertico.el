;;; vertico.el --- VERTical Interactive COmpletion -*- lexical-binding: t -*-

;; Copyright (C) 2021  Free Software Foundation, Inc.

;; Author: Daniel Mendler <mail@daniel-mendler.de>
;; Maintainer: Daniel Mendler <mail@daniel-mendler.de>
;; Created: 2021
;; Version: 0.14
;; Package-Requires: ((emacs "27.1"))
;; Homepage: https://github.com/minad/vertico

;; This file is part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Vertico provides a performant and minimalistic vertical completion UI
;; based on the default completion system. By reusing the built-in
;; facilities, Vertico achieves full compatibility with built-in Emacs
;; completion commands and completion tables.

;;; Code:

(require 'seq)
(eval-when-compile
  (require 'cl-lib)
  (require 'subr-x))

(defgroup vertico nil
  "VERTical Interactive COmpletion."
  :group 'convenience
  :group 'minibuffer
  :prefix "vertico-")

(defcustom vertico-count-format (cons "%-6s " "%s/%s")
  "Format string used for the candidate count."
  :type '(choice (const :tag "No candidate count" nil) (cons string string)))

(defcustom vertico-group-format
  (concat #("    " 0 4 (face vertico-group-separator))
          #(" %s " 0 4 (face vertico-group-title))
          #(" " 0 1 (face vertico-group-separator display (space :align-to right))))
  "Format string used for the group title."
  :type '(choice (const :tag "No group titles" nil) string))

(defcustom vertico-count 10
  "Maximal number of candidates to show."
  :type 'integer)

(defcustom vertico-resize resize-mini-windows
  "How to resize the Vertico minibuffer window.
See `resize-mini-windows' for documentation."
  :type '(choice (const :tag "Fixed" nil)
                 (const :tag "Shrink and grow" t)
                 (const :tag "Grow-only" grow-only)))

(defcustom vertico-cycle nil
  "Enable cycling for `vertico-next' and `vertico-previous'."
  :type 'boolean)

(defcustom vertico-multiline
  (cons #("⤶" 0 1 (face vertico-multiline)) #("…" 0 1 (face vertico-multiline)))
  "Replacements for multiline strings."
  :type '(cons (string :tag "Newline") (string :tag "Truncation")))

(defcustom vertico-sort-function #'vertico-sort-history-length-alpha
  "Default sorting function, which is used if no `display-sort-function' is specified."
  :type `(choice
          (const :tag "No sorting" nil)
          (const :tag "By history, length and alpha" ,#'vertico-sort-history-length-alpha)
          (const :tag "By history and alpha" ,#'vertico-sort-history-alpha)
          (const :tag "By length and alpha" ,#'vertico-sort-length-alpha)
          (const :tag "Alphabetically" ,#'vertico-sort-alpha)
          (function :tag "Custom function")))

(defgroup vertico-faces nil
  "Faces used by Vertico."
  :group 'vertico
  :group 'faces)

(defface vertico-multiline '((t :inherit shadow))
  "Face used to highlight multiline replacement characters.")

(defface vertico-group-title '((t :inherit shadow :slant italic))
  "Face used for the title text of the candidate group headlines.")

(defface vertico-group-separator '((t :inherit shadow :strike-through t))
  "Face used for the separator lines of the candidate groups.")

(defface vertico-current '((t :inherit highlight :extend t))
  "Face used to highlight the currently selected candidate.")

(defvar vertico-map
  (let ((map (make-composed-keymap nil minibuffer-local-map)))
    (define-key map [remap beginning-of-buffer] #'vertico-first)
    (define-key map [remap minibuffer-beginning-of-buffer] #'vertico-first)
    (define-key map [remap end-of-buffer] #'vertico-last)
    (define-key map [remap scroll-down-command] #'vertico-scroll-down)
    (define-key map [remap scroll-up-command] #'vertico-scroll-up)
    (define-key map [remap next-line] #'vertico-next)
    (define-key map [remap previous-line] #'vertico-previous)
    (define-key map [remap next-line-or-history-element] #'vertico-next)
    (define-key map [remap previous-line-or-history-element] #'vertico-previous)
    (define-key map [remap backward-paragraph] #'vertico-previous-group)
    (define-key map [remap forward-paragraph] #'vertico-next-group)
    (define-key map [remap exit-minibuffer] #'vertico-exit)
    (define-key map [remap kill-ring-save] #'vertico-save)
    (define-key map [C-return] #'vertico-exit-input)
    (define-key map "\t" #'vertico-insert)
    map)
  "Vertico minibuffer keymap derived from `minibuffer-local-map'.")

(defvar-local vertico--highlight-function #'identity
  "Deferred candidate highlighting function.")

(defvar-local vertico--history-hash nil
  "History hash table.")

(defvar-local vertico--history-base nil
  "Base prefix of `vertico--history-hash'.")

(defvar-local vertico--candidates-ov nil
  "Overlay showing the candidates.")

(defvar-local vertico--count-ov nil
  "Overlay showing the number of candidates.")

(defvar-local vertico--index -1
  "Index of current candidate or negative for prompt selection.")

(defvar-local vertico--input nil
  "Cons of last minibuffer contents and point or t.")

(defvar-local vertico--candidates nil
  "List of candidates.")

(defvar-local vertico--base 0
  "Size of the base string, which is concatenated with the candidate.")

(defvar-local vertico--total 0
  "Length of the candidate list `vertico--candidates'.")

(defvar-local vertico--lock-candidate nil
  "Lock-in current candidate.")

(defvar-local vertico--lock-groups nil
  "Lock-in current group order.")

(defvar-local vertico--all-groups nil
  "List of all group titles.")

(defvar-local vertico--groups nil
  "List of current group titles.")

(defvar-local vertico--default-missing nil
  "Default candidate is missing from candidates list.")

(defun vertico--history-hash ()
  "Recompute history hash table and return it."
  (or vertico--history-hash
      (let* ((index 0)
             (base vertico--history-base)
             (base-size (length base))
             ;; History disabled if `minibuffer-history-variable' eq `t'.
             (hist (and (not (eq minibuffer-history-variable t))
                        (symbol-value minibuffer-history-variable)))
             (hash (make-hash-table :test #'equal :size (length hist))))
        (if (= base-size 0)
            ;; Put history elements into the hash
            (dolist (elem hist)
              (unless (gethash elem hash)
                (puthash elem index hash))
              (setq index (1+ index)))
          ;; Drop base string from history elements, before putting them into the hash
          (dolist (elem hist)
            (when (and (>= (length elem) base-size)
                       (eq t (compare-strings base 0 base-size elem 0 base-size)))
              (setq elem (substring elem base-size))
              (unless (gethash elem hash)
                (puthash elem index hash)))
            (setq index (1+ index))))
        (setq vertico--history-hash hash))))

(defun vertico--length-string< (x y)
  "Sorting predicate which compares X and Y first by length then by `string<'."
  (or (< (length x) (length y))
      (and (= (length x) (length y))
           (string< x y))))

(defun vertico--sort-decorated (list)
  "Sort decorated LIST and remove decorations."
  (setq list (sort list #'car-less-than-car))
  (let ((item list))
    (while item
      (setcar item (cdar item))
      (pop item)))
  list)

(defmacro vertico--define-sort (by bsize bindex bpred pred)
  "Generate optimized sorting function.
The function is configured by BY, BSIZE, BINDEX, BPRED and PRED."
  `(defun ,(intern (mapconcat #'symbol-name `(vertico sort ,@by) "-")) (candidates)
     ,(concat "Sort candidates by " (mapconcat #'symbol-name by ", ") ".")
     (let* ((buckets (make-vector ,bsize nil))
            ,@(and (eq (car by) 'history) '((hhash (vertico--history-hash)) (hcands))))
       (dolist (% candidates)
         ,(if (eq (car by) 'history)
              ;; Find recent candidates or fill buckets
              `(if-let (idx (gethash % hhash))
                   (push (cons idx %) hcands)
                 (let ((idx (min ,(1- bsize) ,bindex)))
                   (aset buckets idx (cons % (aref buckets idx)))))
             ;; Fill buckets
            `(let ((idx (min ,(1- bsize) ,bindex)))
               (aset buckets idx (cons % (aref buckets idx))))))
       (nconc ,@(and (eq (car by) 'history) '((vertico--sort-decorated hcands)))
              (mapcan (lambda (bucket) (sort bucket #',bpred))
                      (nbutlast (append buckets nil)))
              ;; Last bucket needs special treatment
              (sort (aref buckets ,(1- bsize)) #',pred)))))

(vertico--define-sort (history length alpha) 32 (length %) string< vertico--length-string<)
(vertico--define-sort (history alpha) 32 (if (eq % "") 0 (/ (aref % 0) 4)) string< string<)
(vertico--define-sort (length alpha) 32 (length %) string< vertico--length-string<)
(vertico--define-sort (alpha) 32 (if (eq % "") 0 (/ (aref % 0) 4)) string< string<)

(defun vertico--affixate (metadata candidates)
  "Annotate CANDIDATES with annotation function specified by METADATA."
  (if-let (aff (or (completion-metadata-get metadata 'affixation-function)
                   (plist-get completion-extra-properties :affixation-function)))
      (funcall aff candidates)
    (if-let (ann (or (completion-metadata-get metadata 'annotation-function)
                     (plist-get completion-extra-properties :annotation-function)))
        (mapcar (lambda (cand)
                  (let ((suffix (or (funcall ann cand) "")))
                    (list cand ""
                          ;; The default completion UI adds the `completions-annotations' face
                          ;; if no other faces are present.
                          (if (text-property-not-all 0 (length suffix) 'face nil suffix)
                              suffix
                            (propertize suffix 'face 'completions-annotations)))))
                candidates)
      (mapcar (lambda (cand) (list cand "" "")) candidates))))

(defun vertico--move-to-front (elem list)
  "Move ELEM to front of LIST."
  (if-let (found (member elem list))
      (let ((head (list (car found))))
        (nconc head (delq (setcar found nil) list)))
    list))

;; bug#47711: Deferred highlighting for `completion-all-completions'
;; XXX There is one complication: `completion--twq-all' already adds `completions-common-part'.
;; See below `vertico--candidate'.
(defun vertico--all-completions (&rest args)
  "Compute all completions for ARGS with deferred highlighting."
  (cl-letf* ((orig-pcm (symbol-function #'completion-pcm--hilit-commonality))
             (orig-flex (symbol-function #'completion-flex-all-completions))
             ((symbol-function #'completion-flex-all-completions)
              (lambda (&rest args)
                ;; Unfortunately for flex we have to undo the deferred highlighting, since flex uses
                ;; the completion-score for sorting, which is applied during highlighting.
                (cl-letf (((symbol-function #'completion-pcm--hilit-commonality) orig-pcm))
                  (apply orig-flex args))))
             ;; Defer the following highlighting functions
             (hl #'identity)
             ((symbol-function #'completion-hilit-commonality)
              (lambda (cands prefix &optional base)
                (setq hl (lambda (x) (nconc (completion-hilit-commonality x prefix base) nil)))
                (and cands (nconc cands base))))
             ((symbol-function #'completion-pcm--hilit-commonality)
              (lambda (pattern cands)
                (setq hl (lambda (x)
                           ;; `completion-pcm--hilit-commonality' sometimes throws an internal error
                           ;; for example when entering "/sudo:://u".
                           (condition-case nil
                               (completion-pcm--hilit-commonality pattern x)
                             (t x))))
                cands)))
    ;; Only advise orderless after it has been loaded to avoid load order issues
    (if (and (fboundp 'orderless-highlight-matches) (fboundp 'orderless-pattern-compiler))
        (cl-letf (((symbol-function 'orderless-highlight-matches)
                   (lambda (pattern cands)
                     (let ((regexps (orderless-pattern-compiler pattern)))
                       (setq hl (lambda (x) (orderless-highlight-matches regexps x))))
                     cands)))
          (cons (apply #'completion-all-completions args) hl))
      (cons (apply #'completion-all-completions args) hl))))

(defun vertico--sort-function (metadata)
  "Return the sorting function given the completion METADATA."
  (or (completion-metadata-get metadata 'display-sort-function) vertico-sort-function))

(defun vertico--filter-files (files)
  "Filter FILES by `completion-ignored-extensions'."
  (let ((re (concat "\\(?:\\(?:\\`\\|/\\)\\.\\.?/\\|"
                    (regexp-opt completion-ignored-extensions)
                    "\\)\\'")))
    (or (seq-remove (lambda (x) (string-match-p re x)) files) files)))

(defun vertico--recompute-candidates (pt content bounds metadata)
  "Recompute candidates given PT, CONTENT, BOUNDS and METADATA."
  ;; Redisplay the minibuffer such that the input becomes immediately
  ;; visible before the expensive candidate recomputation is performed (Issue #89).
  ;; Do not redisplay during initialization, since this leads to flicker.
  (when (consp vertico--input) (redisplay))
  (pcase-let* ((field (substring content (car bounds) (+ pt (cdr bounds))))
               ;; `minibuffer-completing-file-name' has been obsoleted by the completion category
               (completing-file (eq 'file (completion-metadata-get metadata 'category)))
               (`(,all . ,hl) (vertico--all-completions content
                                                        minibuffer-completion-table
                                                        minibuffer-completion-predicate
                                                        pt metadata))
               (base (or (when-let (z (last all)) (prog1 (cdr z) (setcdr z nil))) 0))
               (base-str (substring content 0 base))
               (def (or (car-safe minibuffer-default) minibuffer-default))
               (sort (vertico--sort-function metadata))
               (groups))
    ;; Reset the history hash table
    (unless (equal base-str vertico--history-base)
      (setq vertico--history-base base-str vertico--history-hash nil))
    ;; Filter the ignored file extensions. We cannot use modified predicate for this filtering,
    ;; since this breaks the special casing in the `completion-file-name-table' for `file-exists-p'
    ;; and `file-directory-p'.
    (when completing-file
      (setq all (vertico--filter-files all)))
    ;; Sort using the `display-sort-function' or the Vertico sort functions
    (unless (memq sort '(nil identity))
      (setq all (funcall sort all)))
    ;; Move special candidates: "field" appears at the top, before "field/", before default value
    (when (stringp def)
      (setq all (vertico--move-to-front def all)))
    (when (and completing-file (not (string-suffix-p "/" field)))
      (setq all (vertico--move-to-front (concat field "/") all)))
    (setq all (vertico--move-to-front field all))
    (when-let (group-fun (and all (completion-metadata-get metadata 'group-function)))
      (setq groups (vertico--group-by group-fun all) all (car groups)))
    (list base (length all)
          ;; Default value is missing from collection
          (and def (equal content "") (not (member def all)))
          ;; Find position of old candidate in the new list.
          (when vertico--lock-candidate
            (if (< vertico--index 0)
                vertico--index
              (seq-position all (nth vertico--index vertico--candidates))))
          all (cadr groups) (or (caddr groups) vertico--all-groups) hl)))

(defun vertico--cycle (list n)
  "Rotate LIST to position N."
  (nconc (copy-sequence (nthcdr n list)) (seq-take list n)))

(defun vertico--group-by (fun elems)
  "Group ELEMS by FUN."
  (let ((ht (make-hash-table :test #'equal))
        (titles) (groups))
    ;; Build hash table of groups
    (while elems
      (let* ((title (funcall fun (car elems) nil))
             (group (gethash title ht)))
        (if group
            (setcdr group (setcdr (cdr group) elems)) ;; Append to tail of group
          (puthash title (cons elems elems) ht) ;; New group element (head . tail)
          (push title titles))
        (pop elems)))
    (setq titles (nreverse titles))
    ;; Cycle groups if `vertico--lock-groups' is set
    (when-let (group (and vertico--lock-groups
                          (seq-find (lambda (group) (gethash group ht))
                                    vertico--all-groups)))
      (setq titles (vertico--cycle titles (seq-position titles group))))
    ;; Build group list
    (dolist (title titles)
      (push (gethash title ht) groups))
    ;; Unlink last tail
    (setcdr (cdar groups) nil)
    (setq groups (nreverse groups))
    ;; Link groups
    (let ((link groups))
      (while (cdr link)
        (setcdr (cdar link) (caadr link))
        (pop link)))
    ;; Check if new groups are found
    (dolist (group vertico--all-groups)
      (remhash group ht))
    (list (caar groups) titles
          (if (hash-table-empty-p ht) vertico--all-groups titles))))

(defun vertico--remote-p (path)
  "Return t if PATH is a remote path."
  (string-match-p "\\`/[^/|:]+:" (substitute-in-file-name path)))

(defun vertico--update-candidates (pt content bounds metadata)
  "Preprocess candidates given PT, CONTENT, BOUNDS and METADATA."
  (pcase
      ;; If Tramp is used, do not compute the candidates in an interruptible fashion,
      ;; since this will break the Tramp password and user name prompts (See #23).
      (if (and (eq 'file (completion-metadata-get metadata 'category))
               (or (vertico--remote-p content) (vertico--remote-p default-directory)))
          (vertico--recompute-candidates pt content bounds metadata)
        ;; bug#38024: Icomplete uses `while-no-input-ignore-events' to repair updating issues
        (let ((while-no-input-ignore-events '(selection-request))
              (non-essential t))
          (while-no-input (vertico--recompute-candidates pt content bounds metadata))))
    ('nil (abort-recursive-edit))
    (`(,base ,total ,def-missing ,index ,candidates ,groups ,all-groups ,hl)
     (setq vertico--input (cons content pt)
           vertico--index index
           vertico--base base
           vertico--total total
           vertico--highlight-function hl
           vertico--groups groups
           vertico--all-groups all-groups
           vertico--candidates candidates
           vertico--default-missing def-missing)
     ;; If the current index is nil, compute new index. Select the prompt:
     ;; * If there are no candidates
     ;; * If the default is missing from the candidate list.
     ;; * For matching content, as long as the full content after the boundary is empty,
     ;;   including content after point.
     (unless vertico--index
       (setq vertico--lock-candidate nil
             vertico--index
             (if (or vertico--default-missing
                     (= 0 vertico--total)
                     (and (= (car bounds) (length content))
                          (test-completion content minibuffer-completion-table
                                           minibuffer-completion-predicate)))
                 -1 0))))))

(defun vertico--flatten-string (prop str)
  "Flatten STR with display or invisible PROP."
  (let ((end (length str)) (pos 0) (chunks))
    (while (< pos end)
      (let ((next (next-single-property-change pos prop str end))
            (val (get-text-property pos prop str)))
        (cond
         ((and val (eq prop 'display) (stringp val))
          (push val chunks))
         ((not (and val (eq prop 'invisible)))
          (push (substring str pos next) chunks)))
        (setq pos next)))
    (apply #'concat (nreverse chunks))))

(defun vertico--truncate-multiline (cand max-width)
  "Truncate multiline CAND to MAX-WIDTH."
  (truncate-string-to-width
   (thread-last cand
     (replace-regexp-in-string "[\t ]+" " ")
     (replace-regexp-in-string "[\t\n ]*\n[\t\n ]*" (car vertico-multiline))
     (replace-regexp-in-string "\\`[\t\n ]+\\|[\t\n ]+\\'" ""))
   max-width 0 nil (cdr vertico-multiline)))

(defun vertico--format-candidate (cand prefix suffix index _start)
  "Format CAND given PREFIX, SUFFIX and INDEX."
  (setq cand (concat prefix cand suffix "\n")
        cand (vertico--flatten-string 'invisible (vertico--flatten-string 'display cand)))
  (when (= index vertico--index)
    (add-face-text-property 0 (length cand) 'vertico-current 'append cand))
  cand)

(defun vertico--arrange-candidates (metadata)
  "Arrange candidates given the current METADATA."
  (let ((curr-line 0) (lines))
    ;; Compute group titles
    (let* ((index (min (max 0 (- vertico--index (/ vertico-count 2) (1- (mod vertico-count 2))))
                       (max 0 (- vertico--total vertico-count))))
           (title)
           (group-fun (completion-metadata-get metadata 'group-function))
           (group-format (and group-fun vertico-group-format (concat vertico-group-format "\n")))
           (candidates
            (thread-last (seq-subseq vertico--candidates index
                                     (min (+ index vertico-count) vertico--total))
              (funcall vertico--highlight-function)
              (vertico--affixate metadata))))
      (dolist (cand candidates)
        (let ((str (car cand)))
          (when-let (new-title (and group-format (funcall group-fun str nil)))
            (unless (equal title new-title)
              (setq title new-title)
              ;; Restore group title highlighting for prefix titles
              (when (string-prefix-p title str)
                (setq title (substring
                             (car (funcall
                                   vertico--highlight-function
                                   ;; Remove all properties from the title
                                   (list (propertize str 'face 'vertico-group-title))))
                             0 (length title)))
                (vertico--remove-face 0 (length title) 'completions-first-difference title))
              (push (format group-format title) lines))
            (setcar cand (funcall group-fun str 'transform))))
        (when (= index vertico--index)
          (setq curr-line (length lines)))
        (push (cons index cand) lines)
        (setq index (1+ index))))
    ;; Drop excess lines
    (setq lines (nreverse lines))
    (let ((count (length lines)))
      (while (> count vertico-count)
        (if (< curr-line (/ count 2))
            (nbutlast lines)
          (setq curr-line (1- curr-line) lines (cdr lines)))
        (setq count (1- count))))
    ;; Format candidates
    (let ((max-width (- (window-width) 4))
          (line lines) (start))
      (while line
        (pcase (car line)
          (`(,index ,cand ,prefix ,suffix)
           (setq start (or start index))
           (when (string-match-p "\n" cand)
             (setq cand (vertico--truncate-multiline cand max-width)))
           (setcar line (vertico--format-candidate cand prefix suffix index start))))
        (pop line)))
    lines))

(defun vertico--display-candidates (lines)
  "Update candidates overlay `vertico--candidates-ov' with LINES."
  (move-overlay vertico--candidates-ov (point-max) (point-max))
  (overlay-put vertico--candidates-ov 'after-string
               (apply #'concat #(" " 0 1 (cursor t)) (and lines "\n") lines))
  (vertico--resize-window (length lines)))

(defun vertico--resize-window (height)
  "Resize active minibuffer window to HEIGHT."
  (setq-local truncate-lines (< (point) (* 0.8 (window-width))))
  (unless (frame-root-window-p (active-minibuffer-window))
    (unless vertico-resize
      (setq height (max height vertico-count)))
    (let* ((window-resize-pixelwise t)
           (dp (- (max (cdr (window-text-pixel-size))
                       (* (default-line-height) (1+ height)))
                  (window-pixel-height))))
      (when (or (and (> dp 0) (/= height 0))
                (and (< dp 0) (eq vertico-resize t)))
        (window-resize nil dp nil nil 'pixelwise)))))

(defun vertico--format-count ()
  "Format the count string."
  (format (car vertico-count-format)
          (format (cdr vertico-count-format)
                  (cond ((>= vertico--index 0) (1+ vertico--index))
                        ((vertico--allow-prompt-selection-p) "*")
                        (t "!"))
                  vertico--total)))

(defun vertico--display-count ()
  "Update count overlay `vertico--count-ov'."
  (when vertico--count-ov
    (move-overlay vertico--count-ov (point-min) (point-min))
    ;; Set priority for compatibility with `minibuffer-depth-indicate-mode'
    (overlay-put vertico--count-ov 'priority 1)
    (overlay-put vertico--count-ov 'before-string (vertico--format-count))))

(defun vertico--prompt-selection ()
  "Highlight the prompt if selected."
  (let ((inhibit-modification-hooks t))
    (if (and (< vertico--index 0) (vertico--allow-prompt-selection-p))
        (add-face-text-property (minibuffer-prompt-end) (point-max) 'vertico-current 'append)
      (vertico--remove-face (minibuffer-prompt-end) (point-max) 'vertico-current))))

(defun vertico--remove-face (beg end face &optional obj)
  "Remove FACE between BEG and END from OBJ."
  (while (< beg end)
    (let ((val (get-text-property beg 'face obj))
          (next (next-single-property-change beg 'face obj end)))
      (put-text-property beg next 'face (remq face (if (listp val) val (list val))) obj)
      (setq beg next))))

(defun vertico--exhibit ()
  "Exhibit completion UI."
  (let* ((buffer-undo-list t) ;; Overlays affect point position and undo list!
         (pt (max 0 (- (point) (minibuffer-prompt-end))))
         (content (minibuffer-contents-no-properties))
         (before (substring content 0 pt))
         (after (substring content pt))
         (metadata (completion-metadata before
                                        minibuffer-completion-table
                                        minibuffer-completion-predicate))
         ;; bug#47678: `completion-boundaries` fails for `partial-completion`
         ;; if the cursor is moved between the slashes of "~//".
         ;; See also marginalia.el which has the same issue.
         (bounds (or (condition-case nil
                         (completion-boundaries before
                                                minibuffer-completion-table
                                                minibuffer-completion-predicate
                                                after)
                       (t (cons 0 (length after)))))))
    (unless (or (input-pending-p) (equal vertico--input (cons content pt)))
      (vertico--update-candidates pt content bounds metadata))
    (vertico--prompt-selection)
    (vertico--display-count)
    (vertico--display-candidates (vertico--arrange-candidates metadata))))

(defun vertico--allow-prompt-selection-p ()
  "Return t if prompt can be selected."
  (or vertico--default-missing
      (memq minibuffer--require-match '(nil confirm confirm-after-completion))))

(defun vertico--goto (index)
  "Go to candidate with INDEX."
  (let ((prompt (vertico--allow-prompt-selection-p)))
    (setq vertico--index
          (max (if (or prompt (= 0 vertico--total)) -1 0)
               (min index (1- vertico--total)))
          vertico--lock-candidate (or (>= vertico--index 0) prompt))))

(defun vertico-first ()
  "Go to first candidate, or to the prompt when the first candidate is selected."
  (interactive)
  (vertico--goto (if (> vertico--index 0) 0 -1)))

(defun vertico-last ()
  "Go to last candidate."
  (interactive)
  (vertico--goto (1- vertico--total)))

(defun vertico-scroll-down (&optional n)
  "Go back by N pages."
  (interactive "p")
  (vertico--goto (max 0 (- vertico--index (* (or n 1) vertico-count)))))

(defun vertico-scroll-up (&optional n)
  "Go forward by N pages."
  (interactive "p")
  (vertico-scroll-down (- (or n 1))))

(defun vertico-next (&optional n)
  "Go forward N candidates."
  (interactive "p")
  (let ((index (+ vertico--index (or n 1))))
    (vertico--goto
     (cond
      ((not vertico-cycle) index)
      ((= vertico--total 0) -1)
      ((vertico--allow-prompt-selection-p) (1- (mod (1+ index) (1+ vertico--total))))
      (t (mod index vertico--total))))))

(defun vertico-previous (&optional n)
  "Go backward N candidates."
  (interactive "p")
  (vertico-next (- (or n 1))))

(defun vertico--match-p (input)
  "Return t if INPUT is a valid match."
  (or (memq minibuffer--require-match '(nil confirm-after-completion))
      (equal "" input) ;; The questionable null completion
      (test-completion input
                       minibuffer-completion-table
                       minibuffer-completion-predicate)
      (if (eq minibuffer--require-match 'confirm)
          (eq (ignore-errors (read-char "Confirm")) 13)
        (and (message "Match required") nil))))

(defun vertico-exit (&optional arg)
  "Exit minibuffer with current candidate or input if prefix ARG is given."
  (interactive "P")
  (unless arg (vertico-insert))
  (when (vertico--match-p (minibuffer-contents-no-properties))
    (exit-minibuffer)))

(defun vertico-next-group (&optional n)
  "Cycle N groups forward.
When the prefix argument is 0, the group order is reset."
  (interactive "p")
  (when (cdr vertico--groups)
    (if (eq n 0)
        (setq vertico--groups nil
              vertico--all-groups nil
              vertico--lock-groups nil)
      (setq vertico--groups
            (vertico--cycle vertico--groups
                            (let ((len (length vertico--groups)))
                              (- len (mod (- (or n 1)) len))))
            vertico--all-groups
            (vertico--cycle vertico--all-groups
                            (seq-position vertico--all-groups
                                          (car vertico--groups)))
            vertico--lock-groups t))
    (setq vertico--lock-candidate nil
          vertico--input nil)))

(defun vertico-previous-group (&optional n)
  "Cycle N groups backward.
When the prefix argument is 0, the group order is reset."
  (interactive "p")
  (vertico-next-group (- (or n 1))))

(defun vertico-exit-input ()
  "Exit minibuffer with input."
  (interactive)
  (vertico-exit t))

(defun vertico-save ()
  "Save current candidate to kill ring."
  (interactive)
  (if (or (use-region-p) (not transient-mark-mode))
      (call-interactively #'kill-ring-save)
    (kill-new (vertico--candidate))))

(defun vertico-insert ()
  "Insert current candidate in minibuffer."
  (interactive)
  ;; XXX There is a small bug here, depending on interpretation. When
  ;; completing "~/emacs/master/li|/calc" where "|" is the cursor,
  ;; then the returned candidate only includes the prefix
  ;; "~/emacs/master/lisp/", but not the suffix "/calc". Default
  ;; completion has the same problem when selecting in the
  ;; *Completions* buffer. See bug#48356.
  (when-let (cand (and (>= vertico--index 0) (vertico--candidate)))
    (delete-minibuffer-contents)
    (insert cand)))

(defun vertico--candidate (&optional hl)
  "Return current candidate string with optional highlighting if HL is non-nil."
  (let ((content (minibuffer-contents)))
    (if (>= vertico--index 0)
        (let ((cand (nth vertico--index vertico--candidates)))
          ;;; XXX Drop the completions-common-part face which is added by `completion--twq-all'.
          ;; This is a hack in Emacs and should better be fixed in Emacs itself, the corresponding
          ;; code is already marked with a FIXME. Should this be reported as a bug?
          (vertico--remove-face 0 (length cand) 'completions-common-part cand)
          (concat (substring content 0 vertico--base)
                  (if hl (car (funcall vertico--highlight-function (list cand))) cand)))
      ;; Remove prompt face
      (vertico--remove-face 0 (length content) 'vertico-current content)
      content)))

(defun vertico--setup ()
  "Setup completion UI."
  (setq vertico--input t
        vertico--candidates-ov (make-overlay (point-max) (point-max) nil t t)
        vertico--count-ov (and vertico-count-format
                               (make-overlay (point-min) (point-min) nil t t)))
  (setq-local resize-mini-windows 'grow-only
              max-mini-window-height 1.0
              truncate-lines t
              completion-auto-help nil
              completion-show-inline-help nil)
  (use-local-map vertico-map)
  ;; Use -90 to ensure that the exhibit hook runs early such that the
  ;; candidates are available for Consult preview. It works, but besides
  ;; that I'dont have a specific reason for this particular value.
  (add-hook 'post-command-hook #'vertico--exhibit -90 'local))

(defun vertico--advice (orig &rest args)
  "Advice for ORIG completion function, receiving ARGS."
  (minibuffer-with-setup-hook #'vertico--setup (apply orig args)))

;;;###autoload
(define-minor-mode vertico-mode
  "VERTical Interactive COmpletion."
  :global t
  (if vertico-mode
      (progn
        (advice-add #'completing-read-default :around #'vertico--advice)
        (advice-add #'completing-read-multiple :around #'vertico--advice))
    (advice-remove #'completing-read-default #'vertico--advice)
    (advice-remove #'completing-read-multiple #'vertico--advice)))

;; Emacs 28: Do not show Vertico commands in M-X
(dolist (sym '(vertico-next vertico-next-group vertico-previous vertico-previous-group
               vertico-scroll-down vertico-scroll-up vertico-exit vertico-insert
               vertico-exit-input vertico-save vertico-first vertico-last))
  (put sym 'completion-predicate #'vertico--command-p))

(defun vertico--command-p (_sym buffer)
  "Return non-nil if Vertico is active in BUFFER."
  (buffer-local-value 'vertico--input buffer))

(provide 'vertico)
;;; vertico.el ends here
