;;; bitbucket-api.el --- Bitbucket API settings

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

(require 's)

(defconst bitbucket-api-version "2.0"
  "The Bitbucket API version.")

(defconst bitbucket-host "https://api.bitbucket.org/"
  "The Bitbucket hostname.")

(defvar bitbucket-basic-auth nil
  "The Bitbucket Basic Authentication token.")


(defun bitbucket--get-rest-uri (uri)
  "Retrieve the Bitbucket API url.
URI: the api path."
  (s-concat bitbucket-host bitbucket-api-version "/" uri))

(defun bitbucket--get-basic-auth ()
  "Retrieve the Bitbucket auth token.
Use `bitbucket-basic-auth' or BITBUCKET_BASIC_AUTH environment variable"
  (if bitbucket-basic-auth
    bitbucket-basic-auth
    (getenv "BITBUCKET_BASIC_AUTH")))


(provide 'bitbucket-api)
;;; bitbucket-api.el ends here
