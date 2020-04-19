(require 'evil)
(evil-mode 1)


;;==================evil-escape====================
(setq-default evil-escape-delay 0.2)
;; (setq evil-escape-excluded-major-modes '(dired-mode))
(setq-default evil-escape-key-sequence "jk")
;; disable evil-escape when input method is on
(evil-escape-mode 1)

;;==================evil-leader====================
(global-evil-leader-mode)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  ":"  'counsel-M-x

  "xk" 'kill-buffer
  "xs" 'save-buffer

  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window
  "wM" 'delete-other-windows
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

  "cf" 'counsel-grep ; grep current buffer
  "gf" 'counsel-git ; find file
  "gg" 'counsel-git-grep ; quickest grep should be easy to press
  )

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;==================evil-sorround====================
(require 'evil-surround)
(global-evil-surround-mode t)

(provide 'init-evil)
