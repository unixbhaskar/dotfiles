;;; mu4e-views-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "mu4e-views" "mu4e-views.el" (0 0 0 0))
;;; Generated autoloads from mu4e-views.el

(autoload 'mu4e-views-mu4e-use-view-msg-method "mu4e-views" "\
Apply METHOD for viewing emails in mu4e-headers view.

\(fn METHOD)" nil nil)

(autoload 'mu4e-views-mu4e-headers-windows-only "mu4e-views" "\
Show only the headers window of mu4e." t nil)

(autoload 'mu4e-views-cursor-msg-view-window-down "mu4e-views" "\
Scroll message view down if we are viewing the message using xwidget-webkit." t nil)

(autoload 'mu4e-views-cursor-msg-view-window-up "mu4e-views" "\
Scroll message view up if we are viewing the message using xwidget-webkit." t nil)

(autoload 'mu4e-views-mu4e-headers-next "mu4e-views" "\
Move to next message in headers view.

If a xwidget message view is open then use that to show the
message.  With prefix argument move N steps instead.

\(fn &optional N)" t nil)

(autoload 'mu4e-views-mu4e-headers-prev "mu4e-views" "\
Move to previous message in headers view.

If a xwidget message view is open then use that to show the
message.  With prefix argument move N steps backwards instead.

\(fn &optional N)" t nil)

(autoload 'mu4e-views-mu4e-headers-move "mu4e-views" "\
Move point LINES lines.
Forward (if LINES is positive) or backward (if LINES is negative).
If this succeeds, return the new docid.  Otherwise, return nil.

\(fn LINES)" nil nil)

(autoload 'mu4e-views-mu4e-headers-move-wrapper "mu4e-views" "\
Move by N steps in the headers view.

Negative numbers move backwards.  Record the window that we started from to
be able to respect `mu4e-views-next-previous-message-behaviour'.

\(fn N)" t nil)

(autoload 'mu4e-views-mu4e-extract-urls-from-msg "mu4e-views" "\
Prepare mu4e message data structure for MSG.
This data structure is used to support commands like browsing
urls in `mu4e-views' xwidget message view.

\(fn MSG)" t nil)

(autoload 'mu4e-views-mu4e-select-url-from-message "mu4e-views" "\
Select a url from a mu4e message." t nil)

(autoload 'mu4e-views-mu4e-open-attachment "mu4e-views" "\
Select an attached from a mu4e message and open it." t nil)

(autoload 'mu4e-views-mu4e-save-attachment "mu4e-views" "\
Select an attached from a mu4e message and save it." t nil)

(autoload 'mu4e-views-mu4e-save-all-attachments "mu4e-views" "\
Save all attachments to a single directory chosen by the user." t nil)

(autoload 'mu4e-views-mu4e-view-open-attachment "mu4e-views" "\
Wraps the `mu4e-view-open-attachment' function.

Passes on the message stored in `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-view-go-to-url "mu4e-views" "\
Wraps the `mu4e-view-go-to-url' function.

Passes on the message stored in `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-view-save-url "mu4e-views" "\
Wraps the `mu4e-view-save-url' function.

 Passes on the message stored in `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-view-save-attachment "mu4e-views" "\
Wraps the `mu4e-save-attachment' function.

 Passes on the message stored in `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-view-save-all-attachments "mu4e-views" "\
Wraps function to save all attachments using `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-view-action "mu4e-views" "\
Wraps the `mu4e-view-action' function.

Passes on the message stored in `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-view-fetch-url "mu4e-views" "\
Wraps the `mu4e-view-fetch-url' function.

Passes on the message stored in `mu4e-views--current-mu4e-message'." t nil)

(autoload 'mu4e-views-mu4e-select-view-msg-method "mu4e-views" "\
Select the method for viewing emails in `mu4e'." t nil)

(autoload 'mu4e-views-toggle-auto-view-selected-message "mu4e-views" "\
Toggle automatic viewing of message when moving around in the mu4e-headers view." t nil)

(autoload 'mu4e-views-unload-function "mu4e-views" "\
Uninstalls the advices on mu4e functions created by mu4e-views." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mu4e-views" '("mu4e-views-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; mu4e-views-autoloads.el ends here
