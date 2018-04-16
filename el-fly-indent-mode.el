;;; el-fly-indent-mode.el --- Indent Emacs Lisp on the fly

;; Copyright (C) 2018 Jiahao Li

;; Author: Jiahao Li <jiahaowork@gmail.com>
;; Version: 0.1.0
;; Keywords: lisp, languages
;; Homepage: https://github.com/jiahaowork/el-fly-indent-mode.el
;; Package-Requires: ((emacs "25"))

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

;; This minor mode indents Emacs Lisp code on the fly.
;; After installation, add the following piece to you ~/.emacs
;; (el-fly-indent-init)

;; For detailed explanations and more examples see the homepage:
;; https://github.com/jiahaowork/el-fly-indent-mode.el

;;; Code:
(defvar el-fly-indent-flag nil)

(defun el-fly-indent-before-change (begin end)
  "Monitor text between BEGIN and END before any change."
  (when el-fly-indent-mode
    (let ((string (buffer-substring begin end)))
      (when
	  (or
	   (string-match-p "[()]" string)
	   )
	(setq el-fly-indent-flag t)))))

(defun el-fly-indent-after-change (begin end length)
  "Monitor text between BEGIN and END after any change.
LENGTH not used"
  (when el-fly-indent-mode
    (let ((string (buffer-substring begin end)))
      (when
	  (or
	   (string-match-p "[()]" string)
	   (string-match-p "([ \f\t\n\r\v]*\\'" (buffer-substring (point-min) begin))
	   el-fly-indent-flag)
	(indent-region begin (el-fly-indent-region-end begin))
	(setq el-fly-indent-flag nil)))))

(defun el-fly-indent-region-end (start)
  "Determine the end of the region to indent given START."
  (let ((end
	 (string-match
	  "\n[\f\t\n\r\v]*\n[^ \f\t\n\r\v]"
	  (buffer-string)
	  (1- start))))
    (if end
	(1+ end)
      (point-max))))

;;;###autoload
(defun el-fly-indent-init ()
  "Initialization."
  (add-to-list 'before-change-functions 'el-fly-indent-before-change)
  (add-to-list 'after-change-functions 'el-fly-indent-after-change)
  (add-hook 'emacs-lisp-mode-hook #'el-fly-indent-mode)
  )

(defvar el-fly-indent-mode-map (make-sparse-keymap))
;;;###autoload
(define-minor-mode el-fly-indent-mode
  "Minor mode."
  :init-value nil)

(provide 'el-fly-indent-mode)

;;; el-fly-indent-mode.el ends here