;;; org-books-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-books" "org-books.el" (0 0 0 0))
;;; Generated autoloads from org-books.el

(autoload 'org-books-cliplink "org-books" "\
Clip link from clipboard." t nil)

(autoload 'org-books-add-url "org-books" "\
Add book from web URL.

\(fn URL)" t nil)

(autoload 'org-books-add-isbn "org-books" "\
Add book from ISBN.

\(fn ISBN)" t nil)

(autoload 'org-books-add-book "org-books" "\
Add a book (specified by TITLE and AUTHOR) to the `org-books-file'.

Optionally apply PROPS.

\(fn TITLE AUTHOR &optional PROPS)" t nil)

(autoload 'org-books-rate-book "org-books" "\
Apply RATING to book at current point.

\(fn RATING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-books" '("org-books-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-books-autoloads.el ends here
