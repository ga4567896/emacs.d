(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(defvar Shawn/packages '(
			 company
			 company-anaconda
			 rainbow-delimiters
			 smartparens

			 dracula-theme
			 hungry-delete
			 swiper
			 counsel
			 evil
			 evil-escape
			 evil-leader
			 evil-surround
			 ein
			 ibuffer-vc
			 popwin
			 expand-region
			 iedit
			 magit
			 tramp
			 org-pomodoro

			 powerline
			 diminish
			 ace-window
			 winum
			 linum-relative

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

;;===================rainbow-delimiters=================
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode #'rainbow-delimiters-mode)
(add-hook 'lisp-mode #'rainbow-delimiters-mode)

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

;;===================powerline=================
(require 'powerline)
(powerline-center-evil-theme)

;;===================diminish=================
(require 'diminish)


;;===================ace-window=================
;; (setq aw-background nil)

(setq aw-dispatch-always t)

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
    (?m aw-swap-window "Swap Windows")
    (?M aw-move-window "Move Window")
    (?c aw-copy-window "Copy Window")
    (?j aw-switch-buffer-in-window "Select Buffer")
    (?n aw-flip-window)
    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
    (?C aw-split-window-fair "Split Fair Window")
    (?v aw-split-window-vert "Split Vert Window")
    (?b aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows "Delete Other Windows")
    (?? aw-show-dispatch-help))
  "LIST of actions for `aw-dispatch-default'.")


;;===================winum-=================
(require 'winum)

(winum-mode)
;;===================END==================
(provide 'init-packages)
