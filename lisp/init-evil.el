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
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(provide 'init-evil)
