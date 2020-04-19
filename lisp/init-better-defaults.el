;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode 1)
(global-linum-mode t)
(global-visual-line-mode)

(require 'linum-relative)
(setq linum-relative-backend 'display-line-numbers-mode)
(global-display-line-numbers-mode)
(linum-relative-global-mode)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

(setq make-backup-files nil)
(setq auto-save-default nil)
(global-auto-revert-mode t)

(delete-selection-mode t)

;;coding syntax(language)
(set-language-environment 'chinese-gbk)
(prefer-coding-system 'utf-8-auto)
;; Setting English Font
(set-face-attribute
    'default nil :font "Consolas-11")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
		    (font-spec :family "Microsoft JhengHei" :size 19)))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(require 'dired-x)
(setq dired-dwim-target t)

(add-to-list 'exec-path "C:/Program Files/Git/bin")
(setenv "PATH" (mapconcat #'identity exec-path path-separator))

;; dwin = do what I mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)




