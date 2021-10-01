;;; dired-git-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dired-git" "dired-git.el" (0 0 0 0))
;;; Generated autoloads from dired-git.el

(autoload 'dired-git-refresh-using-cache "dired-git" "\
Refresh git overlays using cache." t nil)

(autoload 'dired-git-status "dired-git" "\
Status with for marked directories in dired buffer." t nil)

(autoload 'dired-git-commit "dired-git" "\
Commit with MSG for marked directories in dired buffer.

\(fn MSG)" t nil)

(autoload 'dired-git-stage "dired-git" "\
Stage all for marked directories in dired buffer." t nil)

(autoload 'dired-git-unstage "dired-git" "\
Unstage all for marked directories in dired buffer." t nil)

(autoload 'dired-git-stash "dired-git" "\
Stash all for marked directories in dired buffer." t nil)

(autoload 'dired-git-stash-pop "dired-git" "\
Stash pop all for marked directories in dired buffer." t nil)

(autoload 'dired-git-reset-hard "dired-git" "\
Reset --hard all for marked directories in dired buffer." t nil)

(autoload 'dired-git-branch "dired-git" "\
Checkout to BRANCH all for marked directories in dired buffer.

\(fn BRANCH)" t nil)

(autoload 'dired-git-tag "dired-git" "\
Tag current HEAD to TAG all for marked directories in dired buffer.

\(fn TAG)" t nil)

(autoload 'dired-git-fetch "dired-git" "\
Fetch all for marked directories in dired buffer." t nil)

(autoload 'dired-git-pull "dired-git" "\
Pull for marked directories in dired buffer." t nil)

(autoload 'dired-git-merge "dired-git" "\
Merge BRANCH for marked directories in dired buffer.

\(fn BRANCH)" t nil)

(autoload 'dired-git-push "dired-git" "\
Push for marked directories in dired buffer." t nil)

(autoload 'dired-git-run "dired-git" "\
Invoke COMMAND for marked directories in dired buffer.

\(fn COMMAND)" t nil)

(autoload 'dired-git-mode "dired-git" "\
Minor mode to add git information for dired.

If called interactively, enable Dired-Git mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dired-git" '("dired-git-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dired-git-autoloads.el ends here
