(in-package #:nyxt-user)

;;; Loading files from the same directory.
;;; Can be done individually per file, dolist is there to simplify it.
(dolist (file (list
               (nyxt-init-file "keybinds.lisp")
               (nyxt-init-file "passwd.lisp")
               (nyxt-init-file "status.lisp")
               (nyxt-init-file "style.lisp")))
  (load file))

;;; Loading extensions and third-party-dependent configs. See the
;;; matching files for where to find those extensions.
;;;
;;; Usually, though, it boils down to cloning a git repository into
;;; your `*extensions-path*' and adding a `load-after-system' line
;;; mentioning a config file for this extension.
(load-after-system :nx-search-engines (nyxt-init-file "search-engines.lisp"))
(load-after-system :nx-kaomoji (nyxt-init-file "kaomoji.lisp"))
;; ;; (load-after-system :nx-ace (nyxt-init-file "ace.lisp"))
(load-after-system :slynk (nyxt-init-file "slynk.lisp"))

(define-configuration browser
  ;; This is for Nyxt to never prompt me about restoring the previous session.
  ((session-restore-prompt :never-restore)
   (external-editor-program (list "emacsclient"))))

;;; Those are settings that every type of buffer should share.
(define-configuration (buffer internal-buffer editor-buffer prompt-buffer)
  ;; Emacs keybindings.
  ((default-modes `(emacs-mode ,@%slot-default%))
   ;; This overrides download engine to use WebKit instead of
   ;; Nyxt-native Dexador-based download engine. I don't remember why
   ;; I switched, though.
   (download-engine :renderer)
   ;; I'm weak on the eyes, so I want everything to be a bit
   ;; zoomed-in.
   (current-zoom-ratio 1.20)))

(define-configuration prompt-buffer
  ;; This is to hide the header is there's only one source.
  ;; There also used to be other settings to make prompt-buffer a bit
  ;; more minimalist, but those are internal APIs :(
  ((hide-single-source-header-p t)))

;; Basic modes setup for web-buffer.
(define-configuration web-buffer
  ((default-modes `(emacs-mode
                    auto-mode
                    blocker-mode force-https-mode reduce-tracking-mode
                    ,@%slot-default%))))

;;; Enable proxy in nosave (private, incognito) buffers.
(define-configuration nosave-buffer
  ((default-modes `(proxy-mode ,@%slot-default%))))

(define-configuration nyxt/web-mode:web-mode
  ;; QWERTY home row.
  ((nyxt/web-mode:hints-alphabet "DSJKHLFAGNMXCWEIO")))

;;; This make auto-mode to prompt me about remembering this or that
;;; mode when I toggle it.
(define-configuration nyxt/auto-mode:auto-mode
  ((nyxt/auto-mode:prompt-on-mode-toggle t)))

(define-command-global eval-expression ()
  "Prompt for the expression and evaluate it, echoing result to the `message-area'."
  (let ((expression-string
          ;; Read an arbitrary expression. No error checking, though.
          (first (prompt :prompt "Expression to evaluate"
                         :sources (list (make-instance 'prompter:raw-source))))))
    ;; Message the evaluation result to the message-area down below.
    (echo "~S" (eval (read-from-string expression-string)))))

(define-command-global describe-all ()
  "Prompt for a symbol in any Nyxt-accessible package and describe it in the best way Nyxt can."
  (let* ((all-symbols (apply #'append (loop for package in (list-all-packages)
                                            collect (loop for sym being the external-symbols in package
                                                          collect sym))))
         ;; All copied from /nyxt/source/help.lisp with `describe-any' as a reference.
         (classes (remove-if (lambda (sym)
                               (not (and (find-class sym nil)
                                         (mopu:subclassp (find-class sym) (find-class 'standard-object)))))
                             all-symbols))
         (slots (alexandria:mappend (lambda (class-sym)
                                      (mapcar (lambda (slot) (make-instance 'nyxt::slot
                                                                            :name slot
                                                                            :class-sym class-sym))
                                              (nyxt::class-public-slots class-sym)))
                                    classes))
         (functions (remove-if (complement #'fboundp) all-symbols))
         (variables (remove-if (complement #'boundp) all-symbols)))
    (prompt
     :prompt "Describe:"
     :sources (list (make-instance 'nyxt::variable-source :constructor variables)
                    (make-instance 'nyxt::function-source :constructor functions)
                    (make-instance 'nyxt::user-command-source
                                   :actions (list (make-unmapped-command describe-command)))
                    (make-instance 'nyxt::class-source :constructor classes)
                    (make-instance 'nyxt::slot-source :constructor slots)))))
;; Map Alt key to Meta

(defun meta-translate-modifiers (modifier-state &optional event)
  "Custom modifier translator mapping Meta to what Alt usually means."
  (declare (ignore event))
  (let ((plist '(:control-mask "control"
                 :mod1-mask nil ;; Unmap Alt.
                ;; :meta-mask "meta" ;; Map Meta to Alt.
                 :shift-mask "shift"
                 :super-mask "meta"
                 :hyper-mask "hyper")))
    (delete nil (mapcar (lambda (mod) (getf plist mod)) modifier-state))))

;; Configure the browser to use those modifiers.
(define-configuration browser
  ((modifier-translator #'meta-translate-modifiers)))


;;;;Download youtube videos
;;;; (define-command youtube-dl-current-page ()
;;;;   "Download a Youtube video in the currently open buffer."
;;;;   (with-result (url (buffer-get-url))
;;;;     (uiop:run-program
;;;;      (list "youtube-dl" url))))
;;;; (define-key "C-c d" 'youtube-dl-current-page)

;;;; Excute shell command and show output
;;(define-mode shell-mode ()
;;    "A basic shell prompt."
;;    ((keymap-schemes
;;      :initform
;;      (let ((map (make-keymap)))
;;        (define-key :keymap map
;;          "c" 'run-shell-command
;;          "k" 'clear-shell)
;;        (list :emacs map
;;              :vi-normal map)))))

;;(define-parenscript clear-shell-output ()
;;    (setf (ps:chain document body inner-h-t-m-l) ""))

;;(define-command clear-shell (shell-mode)
;;  "Clear the output in the shell buffer."
;;  (rpc-buffer-evaluate-javascript
;;   *interface* (active-buffer *interface*)
;;   (clear-shell-output)))

;;(define-parenscript append-output (output)
;;  (setf (ps:chain document body inner-h-t-m-l)
;;        (ps:chain document body inner-h-t-m-l
;;                  (concat (ps:lisp
;;                           (format nil "<pre><code>~a</code></pre><br/>" output))))))

;;(define-command run-shell-command (shell-mode)
;;  "Run a shell command."
;;  (with-result
;;      (input (read-from-minibuffer
;;              (minibuffer *interface*)
;;              :input-prompt "Run in shell:"))
;;    (rpc-buffer-evaluate-javascript
;;     *interface* (active-buffer *interface*)
;;     (append-output
;;      :output
;;      (uiop:run-program input :force-shell t :output :string)))))

;;(define-command shell ()
;;  "Open a shell buffer."
;;  (set-active-buffer *interface* (make-buffer :name "*shell*" :default-modes '(shell-mode))))

;; Open pdf in zathura when download finished

(define-configuration browser
      ((after-download-hook
        (hooks:add-hook
         %slot-default%
         (nyxt::make-handler-download
          (lambda (download)
            (when (str:ends-with-p "pdf" (nyxt::destination-path downloads))
          ;;    (echo "Opening ~a i zathura." (nyxt::destination-path downloads))
              (uiop:launch-program `("zathura" ,(nyxt::destination-path downloads)))))
          :name 'open-pdf-in-zathura)))))
