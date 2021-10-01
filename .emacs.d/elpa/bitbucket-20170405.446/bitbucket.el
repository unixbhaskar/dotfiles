;;; bitbucket.el --- Bitbucket API wrapper

;; Copyright (C) 2017 Tjaart van der Walt <tjaart@tjaart.co.za>

;; Author: 2017 Tjaart van der Walt <tjaart@tjaart.co.za>
;; Created: April 4, 2017
;; Version: 0.0.1
;; Keywords: bitbucket
;; Package-Requires: ((emacs "24") (request "0.1.0") (s "1.9.0"))
;; URL: http://github.com/tjaartvdwalt/bitbucket.el/

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

;; API wrapper for Bitbucket (Currently only the Issues API is implemented)
;; Inspired by gitlab.el by Nicolas Lamirault

;;; Code:

(require 'bitbucket-api)
(require 'bitbucket-http)
(require 'bitbucket-issues)

(provide 'bitbucket)
;;; bitbucket.el ends here
