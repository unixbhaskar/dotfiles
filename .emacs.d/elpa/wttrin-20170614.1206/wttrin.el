;;; wttrin.el --- Emacs frontend for weather web service wttr.in
;; Copyright (C) 2016 Carl X. Su

;; Author: Carl X. Su <bcbcarl@gmail.com>
;;         ono hiroko (kuanyui) <azazabc123@gmail.com>
;; Version: 0.2.0
;; Package-Version: 20170614.1206
;; Package-Commit: df5427ce2a5ad4dab652dbb1c4a1834d7ddc2abc
;; Package-Requires: ((emacs "24.4") (xterm-color "1.0"))
;; Keywords: comm, weather, wttrin
;; URL: https://github.com/bcbcarl/emacs-wttrin

;;; Commentary:

;; Provides the weather information from wttr.in based on your query condition.

;;; Code:

(require 'url)
(require 'xterm-color)

(defgroup wttrin nil
  "Emacs frontend for weather web service wttr.in."
  :prefix "wttrin-"
  :group 'comm)

(defcustom wttrin-default-cities '("London" "Kolkata" "New York" "Munich")
  "Specify default cities list for quick completion."
  :group 'wttrin
  :type 'list)

(defcustom wttrin-default-accept-language '("Accept-Language" . "en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4")
  "Specify default HTTP request Header for Accept-Language."
  :group 'wttrin
  :type '(list)
  )

(defun wttrin-fetch-raw-string (query)
  "Get the weather information based on your QUERY."
  (let ((url-user-agent "curl"))
    (add-to-list 'url-request-extra-headers wttrin-default-accept-language)
    (with-current-buffer
        (url-retrieve-synchronously
         (concat "http://wttr.in/" query "?A")
         (lambda (status) (switch-to-buffer (current-buffer))))
      (decode-coding-string (buffer-string) 'utf-8))))

(defun wttrin-exit ()
  (interactive)
  (quit-window t))

(defun wttrin-query (city-name)
  "Query weather of CITY-NAME via wttrin, and display the result in new buffer."
  (let ((raw-string (wttrin-fetch-raw-string city-name)))
    (if (string-match "ERROR" raw-string)
        (message "Cannot get weather data. Maybe you inputed a wrong city name?")
      (let ((buffer (get-buffer-create (format "*wttr.in - %s*" city-name))))
        (switch-to-buffer buffer)
        (setq buffer-read-only nil)
        (erase-buffer)
        (insert (xterm-color-filter raw-string))
        (goto-char (point-min))
        (re-search-forward "^$")
        (delete-region (point-min) (1+ (point)))
        (use-local-map (make-sparse-keymap))
        (local-set-key "q" 'wttrin-exit)
        (local-set-key "g" 'wttrin)
        (setq buffer-read-only t)))))

;;;###autoload
(defun wttrin (city)
  "Display weather information for CITY."
  (interactive
   (list
    (completing-read "City name: " wttrin-default-cities nil nil
                     (when (= (length wttrin-default-cities) 1)
                       (car wttrin-default-cities)))))
  (wttrin-query city))

(provide 'wttrin)

;;; wttrin.el ends here
