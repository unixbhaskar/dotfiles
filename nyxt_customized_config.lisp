(define-configuration browser
  ((theme (make-instance 'theme:theme
                         :dark-p t
                         :background-color "#002b36"
                         :on-background-color "white"
                         :primary-color "rgb(170, 170, 170)"
                         :on-primary-color "black"
                         :secondary-color "rgb(100, 100, 100)"
                         :on-secondary-color "white"
                         :accent-color "#37A8E4"
                         :on-accent-color "black"))))







;;; Browser theme
;;; (define-configuration nyxt/style-mode::dark-mode
;;;     ((nyxt/style-mode::style-associations
;;;        (list (nyxt/style-mode::make-style-association :url  "https://unixbhaskar.wordpress.com"
;;;          :style (cl-css:css
;;;                 '((body
;;;                    :background-color "Black"))))))))

;;; (define-mode my-mode ()
;;;   "A dynamically themable mode."

;;; theme:themed-css uses the current theme for colors.
  ;;; ((style (theme:themed-css (theme *browser*)
;;;              Notice that you need less parentheses here.
                ;;; ("h1"
;;;               The colors like theme:(on-)background,
;;;               theme:(on-)accent, theme:(on-)primary are provided by
;;;               theme:themed-css.
                ;;; :color theme:on-background
                ;;; :background-color theme:background))))



;;; (define-configuration browser
;;;   (make-instance 'theme:theme
;;;                  :dark-p t
;;;                  :background-color- "black"
;;;                  :background-color "white"
;;;     ((theme *browser*))))

;;; (define-configuration status-buffer
;;;     ((style (str:concat %slot-value%
;;;                         (theme:themed-css (theme *browser*))))))

;;; Status bar
;;; (define-configuration status-buffer
;;;   ((style (str:concat
;;;            %slot-default%
;;; 	   (theme:themed-css (theme *browser*))
;;;             :display
;;;             ;;; Arrows on the left.
            ;;; '(("#controls"
            ;;;    :border-top "1px solid white"
              ;;; :background-color "#CD5C5C")
               ;;; :background-color "#002b36")
;;;               ;;; To the right of the arrows.
              ;;; ("#url"
              ;;;  :background-color "black"
              ;;;  :color "black"
              ;;;  :border-top "1px solid white")
;;;               ;;; Far to the right.
              ;;; ("#modes"
               ;;; :background-color "black"
               ;;; :background-color "#002b36"
               ;;; :border-top "1px solid white")
;;;               ;;; The center segment.
              ;;; ("#tabs"
              ;;;   :background-color "#CD5C5C"
              ;;;  :background-color "black"
              ;;;  :color "black"
              ;;;  :border-top "1px solid white"))))))

;;; Panel buffers are the same in regards to style.
;;; (define-configuration (internal-buffer panel-buffer)
;;;   ((style
;;;     (str:concat
;;;      %slot-default%
;;;       '((title
;;;          :color "#CD5C5C")
;;;         (body
;;;          :background-color "black"
;;;          :color "lightgray")
;;;         (hr
;;;          :color "darkgray")
;;;         (a
;;;          :color "#556B2F")
;;;         (.button
;;;          :color "lightgray"
;;;          :background-color "#556B2F"))))))


;;; Open downloaded pdf in zathura

;;; (define-configuration browser
;;; ((after-download-hook
;;; (hooks:add-hook
;;;  %slot-default%
;;;  (nyxt::make-handler-download
;;;   (lambda (download)
;;;     (when (str:ends-with-p "pdf" (nyxt::destination-path download))
;;;       (echo "Opening ~a in zathura." (nyxt::destination-path download))
;;;       (uiop:launch-program `("zathura" ,(nyxt::destination-path download)))))
;;;   :name 'open-pdf-in-zathura)))))


;;; Download youtube videos
 ;;; (define-command youtube-dl-current-page ()
 ;;;   "Download a Youtube video in the currently open buffer."
 ;;;   (with-result (url (buffer-get-url))
 ;;;     (uiop:run-program
 ;;;      (list "youtube-dl" url))))
 ;;; (define-key "C-c d" 'youtube-dl-current-page)

;;; Excute shell command and show output
;;; (define-mode shell-mode ()
;;;     "A basic shell prompt."
;;;     ((keymap-schemes
;;;       :initform
;;;       (let ((map (make-keymap)))
;;;         (define-key :keymap map
;;;           "c" 'run-shell-command
;;;           "k" 'clear-shell)
;;;         (list :emacs map
;;;               :vi-normal map)))))

;;; (define-parenscript clear-shell-output ()
;;;     (setf (ps:chain document body inner-h-t-m-l) ""))

;;; (define-command clear-shell (shell-mode)
;;;   "Clear the output in the shell buffer."
;;;   (rpc-buffer-evaluate-javascript
;;;    *interface* (active-buffer *interface*)
;;;    (clear-shell-output)))

;;; (define-parenscript append-output (output)
;;;   (setf (ps:chain document body inner-h-t-m-l)
;;;         (ps:chain document body inner-h-t-m-l
;;;                   (concat (ps:lisp
;;;                            (format nil "<pre><code>~a</code></pre><br/>" output))))))

;;; (define-command run-shell-command (shell-mode)
;;;   "Run a shell command."
;;;   (with-result
;;;       (input (read-from-minibuffer
;;;               (minibuffer *interface*)
;;;               :input-prompt "Run in shell:"))
;;;     (rpc-buffer-evaluate-javascript
;;;      *interface* (active-buffer *interface*)
;;;      (append-output
;;;       :output
;;;       (uiop:run-program input :force-shell t :output :string)))))

;;; (define-command shell ()
;;;   "Open a shell buffer."
;;;   (set-active-buffer *interface* (make-buffer :name "*shell*" :default-modes '(shell-mode))))

;;; Kamoji
;;; (load-after-system :nx-kaomoji (nyxt-init-file "kaomoji.lisp"))
