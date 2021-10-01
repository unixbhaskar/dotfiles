;;; git-commit-insert-issue-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "git-commit-insert-issue" "git-commit-insert-issue.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from git-commit-insert-issue.el

(autoload 'git-commit-insert-issue-ask-issues "git-commit-insert-issue" "\
Ask for the issue to insert." t nil)

(autoload 'git-commit-insert-issue-mode "git-commit-insert-issue" "\
See the issues when typing 'Fixes #' in a commit message.

If called interactively, enable Git-Commit-Insert-Issue mode if
ARG is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "git-commit-insert-issue" '("+git-commit-insert-issues-gitlab-api-error+" "git-commit-insert-issue-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; git-commit-insert-issue-autoloads.el ends here
