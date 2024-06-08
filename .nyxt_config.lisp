(define-configuration (input-buffer)
  ((default-modes (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

;;; (define-configuration browser
;;;   ((theme theme:+dark-theme+)))

;;; (define-configuration (web-buffer)
;;;   ((default-modes (pushnew 'nyxt/mode/style:dark-mode %slot-value%))))

(defmethod customize-instance ((browser browser) &key)
  (setf (slot-value browser 'restore-session-on-startup-p) nil))

(define-configuration (input-buffer)
  ((default-modes (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

;;; (define-configuration browser
;;;   ((theme theme:+light-theme+)))

(defvar *my-keymap* (make-keymap "my-map"))

(define-key *my-keymap*
            "C-a" 'NYXT/MODE/ANNOTATE:ANNOTATE-HIGHLIGHTED-TEXT
            "C-f" 'nyxt/mode/history:history-forwards
            "C-b" 'nyxt/mode/history:history-backwards)

(define-mode my-mode
    nil
  "Dummy mode for the custom key bindings in *my-keymap*."
  ((keyscheme-map
    (nkeymaps/core:make-keyscheme-map nyxt/keyscheme:cua *my-keymap*
                                      nyxt/keyscheme:emacs *my-keymap*
                                      nyxt/keyscheme:vi-normal
                                      *my-keymap*))))

(define-configuration web-buffer
  "Enable this mode by default."
  ((default-modes (pushnew 'my-mode %slot-value%))))


(defun super-translate-modifiers (modifier-state &optional event)
  "Swap super to meta."
  (declare (ignore event))
  (let ((plist '(:control-mask "control"
                 :mod1-mask nil ;; Unmap Alt
                 :shift-mask "shift"
                 :super-mask "meta" ;; Map Super/Windows key to be perceived as Alt/Meta
                 :hyper-mask "hyper")))
    (delete nil (mapcar (lambda (mod) (getf plist mod)) modifier-state))))

(define-configuration nyxt/renderer/gtk:gtk-browser
    ((nyxt/renderer/gtk:modifier-translator #'super-translate-modifiers)))
