;;; ppp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ppp" "ppp.el" (0 0 0 0))
;;; Generated autoloads from ppp.el

(autoload 'ppp-buffer "ppp" "\
Prettify the current buffer with printed representation of a Lisp object.
IF NOTAILNEWLINE is non-nil, add no last newline.
If NOINDENT is non-nil, don't perform indent sexp.
ppp version of `pp-buffer'." t nil)

(autoload 'ppp-sexp-to-string "ppp" "\
Output the pretty-printed representation of FORM suitable for objects.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-sexp' to get more info.

\(fn FORM)" nil nil)

(autoload 'ppp-macroexpand-to-string "ppp" "\
Output the pretty-printed representation of FORM suitable for macro.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-macroexpand' to get more info.

\(fn FORM)" nil t)

(autoload 'ppp-macroexpand-all-to-string "ppp" "\
Output the pretty-printed representation of FORM suitable for macro.
Unlike `ppp-macroexpand', use `macroexpand-all' instead of `macroexpand-1'.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-macroexpand-all' to get more info.

\(fn FORM)" nil t)

(autoload 'ppp-list-to-string "ppp" "\
Output the pretty-printed representation of FORM suitable for list.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-list' to get more info.

\(fn FORM)" nil nil)

(autoload 'ppp-plist-to-string "ppp" "\
Output the pretty-printed representation of FORM suitable for plist.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-plist' to get more info.

\(fn FORM)" nil nil)

(autoload 'ppp-alist-to-string "ppp" "\
Output the pretty-printed representation of FORM suitable for alist.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-plist' to get more info.

\(fn FORM)" nil nil)

(autoload 'ppp-symbol-function-to-string "ppp" "\
Output the pretty-printed representation of SYMBOL `symbol-function'.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-symbol-funciton' to get more info.

\(fn SYMBOL)" nil nil)

(autoload 'ppp-symbol-value-to-string "ppp" "\
Output the pretty-printed representation of SYMBOL `symbol-value'.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
See `ppp-symbol-value' to get more info.

\(fn SYMBOL)" nil nil)

(autoload 'ppp-sexp "ppp" "\
Output the pretty-printed representation of FORM suitable for objects.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn FORM)" nil nil)

(autoload 'ppp-macroexpand "ppp" "\
Output the pretty-printed representation of FORM suitable for macro.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn FORM)" nil t)

(autoload 'ppp-macroexpand-all "ppp" "\
Output the pretty-printed representation of FORM suitable for macro.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.
Unlike `ppp-macroexpand', use `macroexpand-all' instead of `macroexpand-1'.

\(fn FORM)" nil t)

(autoload 'ppp-list "ppp" "\
Output the pretty-printed representation of FORM suitable for list.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn FORM)" nil nil)

(autoload 'ppp-plist "ppp" "\
Output the pretty-printed representation of FORM suitable for plist.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn FORM)" nil nil)

(autoload 'ppp-alist "ppp" "\
Output the pretty-printed representation of FORM suitable for alist.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn FORM)" nil nil)

(autoload 'ppp-symbol-function "ppp" "\
Output `symbol-function' for SYMBOL.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn SYMBOL)" nil nil)

(autoload 'ppp-symbol-value "ppp" "\
Output `symbol-value' for SYMBOL.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn SYMBOL)" nil nil)

(autoload 'ppp-alist-to-plist "ppp" "\
Convert ALIST to plist.
If NOTAILNEWLINE is non-nil, add no newline at tail newline.

\(fn ALIST &optional NOTAILNEWLINE)" nil nil)

(autoload 'ppp-debug "ppp" "\
Output debug message to `flylint-debug-buffer'.

ARGS accepts (KEYWORD-ARGUMENTS... PKG FORMAT &rest FORMAT-ARGS).

Auto arguments:
  PKG is symbol.
  FORMAT and FORMAT-ARGS passed `format'.

Keyword arguments:
  If LEVEL is specified, output higher than
  `ppp-minimum-warning-level--{{PKG}}' initialized `ppp-minimum-warning-level'.
  LEVEL should be one of :debug, :warning, :error, or :emergency.
  If LEVEL is omitted, assume :debug.
  If BUFFER is specified, output that buffer.
  If POPUP is non-nil, `display-buffer' debug buffer.
  If BREAK is non-nil, output page break before output string.

Note:
  If use keyword arguments, must specified these before auto arguments.

\(fn &key buffer level break PKG FORMAT &rest FORMAT-ARGS)" nil t)

(function-put 'ppp-debug 'lisp-indent-function 'defun)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ppp" '("ppp-" "with-ppp--working-buffer")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ppp-autoloads.el ends here
