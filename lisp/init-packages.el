(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(defvar Shawn/packages '(
			 company
			 company-anaconda
			 dracula-theme
			 hungry-delete
			 swiper
			 counsel
			 linum-relative
			 evil
			 evil-escape
			 ein
			 ibuffer-vc
			 smartparens
			 popwin
			 expand-region
			 iedit
			 magit
			 tramp
			 org-pomodoro
			 ) "Default packages")

(setq package-selected-packages Shawn/packages)

(defun Shawn/packages-installed-p()
  (loop for pkg in Shawn/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (Shawn/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg Shawn/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;===================company=================
(global-company-mode t)

;;===================hungry-delete=================
(global-hungry-delete-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
;;===================swiper(ivy)=================
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


;;===================smartparens=================
(smartparens-global-mode)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;;===================popwin=================
(popwin-mode t)

;;===================theme=================
(load-theme 'dracula t)

;;===================expand-region=================
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;;===================iedit=================
(require 'iedit)

;;===================magit=================
(require 'magit)

;;===================tramp=================
(require 'tramp)
(setq tramp-default-method "plink")

;;===================org-pomodoro=================
(require 'org-pomodoro)

;;===================END==================
(provide 'init-packages)
