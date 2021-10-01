;;; bitbucket-issues.el --- Bitbucket Issues API

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
(require 's)

(defun bitbucket-issues-list (username repo_slug &optional page pagelen params)
  "A paginated list of issues for the given repo.
USERNAME: the project username
REPO_SLUG: the repository slug
PAGE: current page number
PAGELEN: number of items on page max 100
PARAMS: an alist for query parameters"
  (progn
    (when page
      (add-to-list 'params (cons 'pagelen (number-to-string pagelen))))
    (when pagelen
      (add-to-list 'params (cons 'page (number-to-string page))))
    (cdr (assq 'values (perform-bitbucket-request "GET"
                         (s-concat "repositories/"
                           (url-hexify-string
                             (format "%s" username))
                           "/"
                           (url-hexify-string
                             (format "%s" repo_slug))
                           "/issues")
                         params
                         200)))))

(defun bitbucket-issues-count (username repo_slug)
  "Return the number of issues for the repo.
USERNAME: the project username
REPO_SLUG: the repository slug"
  (cdr (assq 'size (perform-bitbucket-request "GET"
                     (s-concat "repositories/"
                       (url-hexify-string
                         (format "%s" username))
                       "/"
                       (url-hexify-string
                         (format "%s" repo_slug))
                       "/issues")
                     nil
                     200))))

(defun bitbucket-issues-list-all (username repo_slug &optional params)
  "A list of all issues for the given repo.
USERNAME: the project username
REPO_SLUG: the repository slug
PARAMS: an alist for query parameters"
  (interactive)
  (let* ((page 1)
          (pagelen 100)
          (issues)
          (all-issues (bitbucket-issues-list username repo_slug page pagelen))
          (all-issues-count (bitbucket-issues-count username repo_slug)))
    (while (>= all-issues-count (* page pagelen))
      (setq issues (bitbucket-issues-list username repo_slug page pagelen))
      (setq all-issues (vconcat all-issues issues))
      (setq all-issues-count (length all-issues))
      (setq page (1+ page)))
    all-issues))



(provide 'bitbucket-issues)
;;; bitbucket-issues.el ends here
