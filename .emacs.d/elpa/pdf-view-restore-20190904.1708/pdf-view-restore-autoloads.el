;;; pdf-view-restore-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pdf-view-restore" "pdf-view-restore.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from pdf-view-restore.el

(autoload 'pdf-view-restore-mode "pdf-view-restore" "\
Automatically restore last known pdf position

If called interactively, enable Pdf-View-Restore mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-view-restore" '("pdf-view-restore" "use-file-base-name-flag")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pdf-view-restore-autoloads.el ends here
