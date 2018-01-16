;;; find-key-binding.el --- Find where a key binding is defined  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Xu Chunyang

;; Author: Xu Chunyang <mail@xuchunyang.me>
;; Homepage: https://github.com/xuchunyang/find-key-binding.el
;; Package-Requires: ((emacs "25") (el-search "1.4"))
;; Version: 0
;; Created: 2018-01-16T22:15:49+08:00

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; https://emacs.stackexchange.com/questions/38092/jump-to-where-a-keybinding-is-defined

;;; Code:

(require 'el-search)
(require 'el-search-x)
(require 'find-func)

(defun find-key-binding--symbol-file (symbol)
  (let ((file (symbol-file symbol)))
    (when file
      (find-library-name file))))

;;;###autoload
(defun find-key-binding (key)
  "Find where binding of KEY is created."
  (interactive "kFind key binding: ")
  (let* ((fun (key-binding key))
         (map (help--binding-locus key nil))
         (sources
          (delete-dups
           (delq nil
                 (list (find-key-binding--symbol-file fun)
                       (find-key-binding--symbol-file map))))))
    (when sources
      (el-search-setup-search
       (list '\` (list 'define-key ',_ (list '\, `(keys ,key)) `',fun))
       (lambda () (stream sources))))))

(provide 'find-key-binding)

;; Local Variables:
;; indent-tabs-mode: nil
;; fill-column: 100
;; End:

;;; find-key-binding.el ends here
