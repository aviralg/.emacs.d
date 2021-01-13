(use-package counsel
  :ensure t
  :config (progn (ivy-mode 1)
		 (setq ivy-use-virtual-buffers t)
		 (setq ivy-count-format "(%d/%d) ")
		 (counsel-mode 1)))

(use-package drag-stuff
  :ensure t
  :config (progn (drag-stuff-mode t)))

(defhydra hydra-text (:color blue)
  "+text"
  ("l" drag-stuff-right)
  ("j" drag-stuff-up)
  ("k" drag-stuff-down)
  ("h" drag-stuff-left))

(global-set-key (kbd "C-c t") 'hydra-text/body)
