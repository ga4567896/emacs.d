(require 'evil)
(evil-mode 1)

(setq-default evil-escape-delay 0.2)
(setq evil-escape-excluded-major-modes '(dired-mod))
(setq-default evil-escape-key-sequence "kj")
;; disable evil-escape when input method is on
(evil-escape-mode 1)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(provide 'init-evil)
