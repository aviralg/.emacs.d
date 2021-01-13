
;; https://github.com/oneKelvinSmith/monokai-emacs
(use-package monokai-theme
  :ensure t
  :config
  (progn (load-theme 'monokai t)))

;; https://github.com/incandescentman/Emacs-Settings/blob/master/fonts-and-themes.org
(set-face-attribute 'default nil :font "Cascadia Code PL" :height 140)

;; http://kb.mit.edu/confluence/display/istcontrib/Disabling+the+Emacs+menubar%2C+toolbar%2C+or+scrollbar
;; to disable the menu bar
(menu-bar-mode -1)
;; to disable the scrollbar
(toggle-scroll-bar -1)
;; to disable the toolbar
(tool-bar-mode -1)


;; https://github.com/emacs-dashboard/emacs-dashboard

(use-package all-the-icons :ensure t)
(use-package page-break-lines :ensure t)
(use-package projectile :ensure t)

(use-package dashboard
  :ensure t
  :requires (page-break-lines all-the-icons projectile)
  :config
  (progn (dashboard-setup-startup-hook)
	 ;; Set the title
	 (setq dashboard-banner-logo-title "Welcome to Emacs!")
	 (setq dashboard-projects-backend 'projectile)
	 ;; Set the banner
	 (setq dashboard-startup-banner 'logo)
	 ;; Value can be
	 ;; 'official which displays the official emacs logo
	 ;; 'logo which displays an alternative emacs logo
	 ;; 1, 2 or 3 which displays one of the text banners
	 ;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer
	 (setq dashboard-set-heading-icons t)
	 (setq dashboard-set-file-icons t)
	 ;; Content is not centered by default. To center, set
	 (setq dashboard-center-content t)
	 (setq dashboard-set-navigator t)
	 (setq dashboard-items '((recents  . 20)
				 (bookmarks . 20)
				 (projects . 20)
				 (agenda . 20)
				 (registers . 20)))
	 (setq dashboard-set-init-info t)
	 (setq dashboard-set-footer nil)
	 (setq initial-buffer-choice #'(lambda () (get-buffer-create "*dashboard*")))

	 (switch-to-buffer "*dashboard*")
	 (dashboard-insert-startupify-lists)
	 )
  )


(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; doom-modeline
;; https://github.com/seagle0128/doom-modeline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Or use this
;; Use `window-setup-hook' if the right segment is displayed incorrectly
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (progn ;; How tall the mode-line should be. It's only respected in GUI.
    ;; If the actual char height is larger, it respects the actual height.
    (setq doom-modeline-height 24)

    ;; How wide the mode-line bar should be. It's only respected in GUI.
    (setq doom-modeline-bar-width 3)

    ;; The limit of the window width.
    ;; If `window-width' is smaller than the limit, some information won't be displayed.
    (setq doom-modeline-window-width-limit fill-column)
    
    (setq doom-modeline-project-detection 'projectile)

    (setq doom-modeline-buffer-file-name-style 'auto)

    ;; Whether display icons in the mode-line.
    ;; While using the server mode in GUI, should set the value explicitly.
    (setq doom-modeline-icon (display-graphic-p))

    ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
    (setq doom-modeline-major-mode-icon t)

    ;; Whether display the colorful icon for `major-mode'.
    ;; It respects `all-the-icons-color-icons'.
    (setq doom-modeline-major-mode-color-icon t)

    ;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
    (setq doom-modeline-buffer-state-icon t)

    ;; Whether display the modification icon for the buffer.
    ;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
    (setq doom-modeline-buffer-modification-icon t)

    ;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
    (setq doom-modeline-unicode-fallback t)

    ;; Whether display the minor modes in the mode-line.
    (setq doom-modeline-minor-modes t)

    ;; If non-nil, a word count will be added to the selection-info modeline segment.
    (setq doom-modeline-enable-word-count t)

    ;; Major modes in which to display word count continuously.
    ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
    ;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
    ;; remove the modes from `doom-modeline-continuous-word-count-modes'.
    (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

    ;; Whether display the buffer encoding.
    (setq doom-modeline-buffer-encoding t)

    ;; Whether display the indentation information.
    (setq doom-modeline-indent-info nil)

    ;; If non-nil, only display one number for checker information if applicable.
    (setq doom-modeline-checker-simple-format t)

    ;; The maximum number displayed for notifications.
    (setq doom-modeline-number-limit 99)

    ;; The maximum displayed length of the branch name of version control.
    (setq doom-modeline-vcs-max-length 12)

    ;; Whether display the workspace name. Non-nil to display in the mode-line.
    (setq doom-modeline-workspace-name t)

    ;; Whether display the perspective name. Non-nil to display in the mode-line.
    (setq doom-modeline-persp-name t)

    ;; If non nil the default perspective name is displayed in the mode-line.
    (setq doom-modeline-display-default-persp-name t)

    ;; If non nil the perspective name is displayed alongside a folder icon.
    (setq doom-modeline-persp-icon t)

    ;; Whether display the `lsp' state. Non-nil to display in the mode-line.
    (setq doom-modeline-lsp t)

    ;; Whether display the GitHub notifications. It requires `ghub' package.
    (setq doom-modeline-github nil)

    ;; The interval of checking GitHub.
    (setq doom-modeline-github-interval (* 30 60))

    ;; Whether display the modal state icon.
    ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
    (setq doom-modeline-modal-icon t)

    ;; Whether display the environment version.
    (setq doom-modeline-env-version t)
    ;; Or for individual languages
    (setq doom-modeline-env-enable-python t)
    (setq doom-modeline-env-enable-ruby t)
    (setq doom-modeline-env-enable-perl t)
    (setq doom-modeline-env-enable-go t)
    (setq doom-modeline-env-enable-elixir t)
    (setq doom-modeline-env-enable-rust t)

    ;; Change the executables to use for the language version string
    (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
    (setq doom-modeline-env-ruby-executable "ruby")
    (setq doom-modeline-env-perl-executable "perl")
    (setq doom-modeline-env-go-executable "go")
    (setq doom-modeline-env-elixir-executable "iex")
    (setq doom-modeline-env-rust-executable "rustc")

    ;; What to dispaly as the version while a new one is being loaded
    (setq doom-modeline-env-load-string "...")

    ;; Hooks that run before/after the modeline version string is updated
    (setq doom-modeline-before-update-env-hook nil)
    (setq doom-modeline-after-update-env-hook nil))
  )
