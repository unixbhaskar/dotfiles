;;; popup-edit-menu-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "popup-edit-menu" "popup-edit-menu.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from popup-edit-menu.el

(let ((loads (get 'popup-edit-menu 'custom-loads))) (if (member '"popup-edit-menu" loads) nil (put 'popup-edit-menu 'custom-loads (cons '"popup-edit-menu" loads))))

(defvar popup-edit-menu-keep-header-flag nil "\
Non-nil means keep header in popup edit menu...")

(custom-autoload 'popup-edit-menu-keep-header-flag "popup-edit-menu" t)

(defvar popup-edit-menu-mode-menus-down-flag nil "\
Non-nil means move mode menus on the bottom...")

(custom-autoload 'popup-edit-menu-mode-menus-down-flag "popup-edit-menu" t)

(defvar popup-edit-menu-never-menu-bar-flag nil "\
Non-nil means never pop-up menu-bar even no menu-bar-lines...")

(custom-autoload 'popup-edit-menu-never-menu-bar-flag "popup-edit-menu" t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "popup-edit-menu" '("popup-edit-menu-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; popup-edit-menu-autoloads.el ends here
