(with-eval-after-load 'org
  ;; Let's have pretty source code blocks
  (setq org-src-fontify-natively t)

  (setq org-agenda-files '("~/.emacs.d"))

  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "GTD")
	   "\n* TODO [#B] %?\n  %i \n"
	   :empty-lines 1)))
  )
;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)
(provide 'init-org)
