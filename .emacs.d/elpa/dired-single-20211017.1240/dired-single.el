;;; dired-single.el --- Reuse the current dired buffer to visit a directory

;; Version:    0.1.0
;; Package-Version: 20211017.1240
;; Package-Commit: f760aa94ea3f87845dd2325287d05447322a60bc
;; Keywords:   dired, reuse, buffer
;; URL:        https://github.com/crocket/dired-single
;; License:    public-domain

;;; Code:
(eval-when-compile
  (defvar byte-compile-dynamic nil) ; silence the old byte-compiler
  (set (make-local-variable 'byte-compile-dynamic) t))

(eval-and-compile
  (require 'cl-lib)
  (require 'dired)
  (autoload 'dired-get-filename "dired"))

;;; **************************************************************************
;;; ***** customization routines
;;; **************************************************************************
(defgroup dired-single nil
  "dired-single package customization"
  :group 'tools)

;; ---------------------------------------------------------------------------
(defun dired-single-customize ()
  "Customization of the group `dired-single'."
  (interactive)
  (customize-group "dired-single"))

;; ---------------------------------------------------------------------------
(defcustom dired-single-use-magic-buffer t
  "Boolean that indicates the use of a single dired buffer name.

It is used to determine if the dired-single functions should look for and
retain a specific buffer name.  The buffer name to look for is specified
with `dired-single-magic-buffer-name'."
  :group 'dired-single
  :type 'boolean)

;; ---------------------------------------------------------------------------
(defcustom dired-single-magic-buffer-name "*dired*"
  "Name of buffer to use if `dired-single-use-magic-buffer' is true.

Once a dired buffer has this name, it will always keep this name (unless it's
   explicitly renamed by you)."
  :group 'dired-single
  :type 'string)

;; ---------------------------------------------------------------------------
(defcustom dired-single-load-hook nil
  "Hook to run when package is loaded."
  :type 'hook
  :group 'dired-single)

;;; **************************************************************************
;;; ***** version related routines
;;; **************************************************************************
(defconst dired-single-version
  "$Revision: 1.7 $"
  "Version number for dired-single package.")

;; ---------------------------------------------------------------------------
(defun dired-single-version-number ()
  "Return dired-single version number."
  (string-match "[0123456789.]+" dired-single-version)
  (match-string 0 dired-single-version))

;; ---------------------------------------------------------------------------
(defun dired-single-display-version ()
  "Display dired-single version."
  (interactive)
  (message "dired-single version <%s>." (dired-single-version-number)))

;;; **************************************************************************
;;; ***** interactive functions
;;; **************************************************************************
;;;###autoload
(defun dired-single-buffer (&optional default-dirname)
  "Visit selected directory in current buffer.

Visits the selected directory in the current buffer, replacing the
   current contents with the contents of the new directory.  This doesn't
   prevent you from having more than one dired buffer.  The main difference
   is that a given dired buffer will not spawn off a new buffer every time
   a new directory is visited.

If the variable `dired-single-use-magic-buffer' is non-nil, and the current
   buffer's name is the same as that specified by the variable
`dired-single-magic-buffer-name', then the new directory's buffer will retain
   that same name (i.e. not only will dired only use a single buffer, but
its name will not change every time a new directory is entered).

Optional argument DEFAULT-DIRNAME specifies the directory to visit; if not
specified, the directory or file on the current line is used (assuming it's
a dired buffer).  If the current line represents a file, the file is visited
in another window."
  (interactive)
  ;; use arg passed in or find name of current line
  (let ((name (or default-dirname (dired-get-filename nil t))))
    (save-excursion
      (save-match-data
        ;; See if the selection is a directory or not.
        (end-of-line)
        (let ((eol (point)))
          (beginning-of-line)
          ;; assume directory if arg passed in
          (if (or default-dirname (re-search-forward "^  d" eol t))
              ;; save current buffer's name
              (let ((current-buffer-name (buffer-name)))
                ;; go ahead and read in the directory
                (find-alternate-file name)
                ;; if the saved buffer's name was the magic name, rename this buffer
                (if (and dired-single-use-magic-buffer
                         (string= current-buffer-name dired-single-magic-buffer-name))
                    (rename-buffer dired-single-magic-buffer-name)))
            ;; it's just a file
            (find-file name)))))))

;;;; ------------------------------------------------------------------------
;;;###autoload
(defun dired-single-buffer-mouse (click)
  "Mouse-initiated version of `dired-single-buffer' (which see).

Argument CLICK is the mouse-click event."
  (interactive "e")
  (let* ( (start (event-start click))
          (window (car start))
          (pos (car (cdr start))) )
    (select-window window)
    (goto-char pos))
  (dired-single-buffer))

;;;; ------------------------------------------------------------------------
;;;###autoload
(defun dired-single-magic-buffer (&optional default-dirname)
  "Switch to buffer whose name is the value of `dired-single-magic-buffer-name'.

If no such buffer exists, launch dired in a new buffer and rename that buffer
to the value of `dired-single-magic-buffer-name'.  If the current buffer is the
magic buffer, it will prompt for a new directory to visit.

Optional argument DEFAULT-DIRNAME specifies the directory to visit (defaults to
the currently displayed directory)."
  (interactive)
  ;; do we not have one or are we already in it?
  (let ((magic-dired-buffer (get-buffer dired-single-magic-buffer-name)))
    (if (or (eq magic-dired-buffer nil)
            (eq magic-dired-buffer (current-buffer)))
        ;; nothing to switch to
        ;; get directory name to start in
        (let ((dirname (or default-dirname
                           (read-file-name (format "Dired %s(directory): " "")
                                           nil default-directory t))))

          ;; make sure it's really a directory
          (if (not (file-directory-p dirname))
              (error "Error: <%s> is not a directory" dirname))

          ;; do we need a new buffer?
          (if (eq magic-dired-buffer nil)
              ;; find the file in new buffer, current window
              (find-file dirname)
            ;; just find in place of current buffer
            (find-alternate-file dirname))
          ;; rename the buffer, where ever we found it
          (rename-buffer dired-single-magic-buffer-name))
      ;; we're not there (we have one already), so simply switch to it
      (switch-to-buffer magic-dired-buffer)
      ;; if called with a default, try it again
      (if default-dirname
          (dired-single-magic-buffer default-dirname)))))

;;;; ------------------------------------------------------------------------
;;;###autoload
(defun dired-single-toggle-buffer-name ()
  "Toggle between the 'magic' buffer name and the 'real' dired buffer name.

Will also seek to uniquify the 'real' buffer name."
  (interactive)

  ;; make sure it's a dired buffer
  (if (not (string= major-mode "dired-mode"))
      (error "Error: not a dired buffer"))

  ;; do we have magic name currently?
  (if (string= (buffer-name) dired-single-magic-buffer-name)
      (rename-buffer
       (abbreviate-file-name
        (expand-file-name (directory-file-name default-directory))) t)

    ;; make sure the buffer doesn't currently exist
    (let ((existing-buffer (get-buffer dired-single-magic-buffer-name)))
      (if existing-buffer
          (kill-buffer existing-buffer))
      (rename-buffer dired-single-magic-buffer-name))))

;;;; ------------------------------------------------------------------------
;;;###autoload
(defun dired-single-up-directory (&optional other-window)
  "Like `dired-up-directory' but with `dired-single-buffer'."
  (interactive)
  ;; replace dired with dired-single-buffer
  (cl-letf (((symbol-function 'dired) (symbol-function 'dired-single-buffer)))
    (dired-up-directory other-window)))

;;; **************************************************************************
;;; ***** we're done
;;; **************************************************************************
(provide 'dired-single)
(run-hooks 'dired-single-load-hook)

;;; dired-single.el ends here
