(require 'evil)
(evil-mode 1)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;==================evil-escape====================
(setq-default evil-escape-delay 0.2)
;; (setq evil-escape-excluded-major-modes '(dired-mode))
(setq-default evil-escape-key-sequence "jk")
;; disable evil-escape when input method is on
(evil-escape-mode 1)

;;==================evil-sorround====================
(require 'evil-surround)
(global-evil-surround-mode t)

;;==================evil-leader====================
(global-evil-leader-mode)

(evil-leader/set-key
  ":"  'counsel-M-x

  "bi"  'ibuffer
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "bs" 'save-buffer

  "wr" 'split-window-right
  "wb" 'split-window-below
  "wd" 'delete-window
  "wo" 'delete-other-windows
  "wa" 'ace-window
  "0" 'winum-select-window-0-or-10
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4
  "5" 'winum-select-window-5
  "6" 'winum-select-window-6
  "7" 'winum-select-window-7
  "8" 'winum-select-window-8
  "9" 'winum-select-window-9

  "df" 'find-file
  "da" 'dired-at-point

  "es" 'eshell
  "sh" 'shell

  "cf" 'counsel-grep ; grep current buffer
  "gf" 'counsel-git ; find file
  "gg" 'counsel-git-grep ; quickest grep should be easy to press

  "ew" 'pyvenv-workon

  "ms" 'bookmark-set
  "mj" 'bookmark-jump
  "ml" 'bookmark-bmenu-list
  )

(provide 'init-evil)
