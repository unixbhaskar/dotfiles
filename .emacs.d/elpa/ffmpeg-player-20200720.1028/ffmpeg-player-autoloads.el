;;; ffmpeg-player-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ffmpeg-player" "ffmpeg-player.el" (0 0 0 0))
;;; Generated autoloads from ffmpeg-player.el

(autoload 'ffmpeg-player-clean "ffmpeg-player" "\
Clean all the data, like images cache." t nil)

(autoload 'ffmpeg-player-video "ffmpeg-player" "\
Play the video with PATH.

\(fn PATH)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ffmpeg-player" '("ffmpeg-player-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ffmpeg-player-autoloads.el ends here
