;;; bitbucket-issues.el --- Bitbucket HTTP tools

;; Copyright (C) 2017 Tjaart van der Walt <tjaart@tjaart.co.za>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'json)
(require 'request)
(require 'bitbucket-api)

(defun bitbucket--get-headers ()
  "Return the HTTP headers for Bitbucket API."
  (list (cons "Authorization" (s-concat "Basic " (bitbucket--get-basic-auth)))
    (cons "connection" "close")))

(defun bitbucket--perform-get-request (uri params)
  "Doc string URI PARAMS."
  (let* ((response (request (bitbucket--get-rest-uri uri)
                     :type "GET"
                     :headers (bitbucket--get-headers)
                     :sync t
                     :params params
                     :parser 'json-read)))
    response))

(defun bitbucket--perform-post-request (uri params)
  "Doc string URI PARAMS."
  (let ((response (request (bitbucket--get-rest-uri uri)
                    :type "POST"
                    :headers (bitbucket--get-headers)
                    :sync t
                    :data params
                    :parser 'json-read)))
    response))

(defun bitbucket--perform-put-request (uri params)
  "Doc string URI PARAMS."
  (let ((response (request (bitbucket--get-rest-uri uri)
                    :type "PUT"
                    :headers (bitbucket--get-headers)
                    :sync t
                    :data params
                    :parser 'json-read)))
    response))

(defun perform-bitbucket-request (type uri params status-code)
  "Doc string TYPE URI PARAMS STATUS-CODE."
  (let ((response
          (cond ((string= type "POST")
                  (bitbucket--perform-post-request uri params))
            ((string= type "GET")
              (bitbucket--perform-get-request uri params))
            ((string= type "PUT")
              (bitbucket--perform-put-request uri params)))))
    (if (= status-code (request-response-status-code response))
      (request-response-data response)
      (lwarn '(bitbucket)
        :error "HTTP %s Error %s on URI: %s"
        type
        (request-response-status-code response)
        uri))))


(provide 'bitbucket-http)
;;; bitbucket-http.el ends here
