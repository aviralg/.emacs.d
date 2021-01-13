(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; https://www.gnu.org/software/emacs/manual/html_node/eintr/Loading-Files.html
;;(setq load-path (cons "~/.emacs.d/init" load-path))
(load-library "~/.emacs.d/init-theme")
(load-library "~/.emacs.d/init-vterm")
(load-library "~/.emacs.d/init-academic-phrases")
(load-library "~/.emacs.d/init-counsel")


;; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(package-selected-packages
 ;;  '(vterm use-package projectile monokai-theme hydra doom-modeline dashboard counsel ace-window)))
 ;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(drag-stuff vterm use-package projectile monokai-theme hydra doom-modeline dashboard counsel all-the-icons-ibuffer ace-window academic-phrases)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
