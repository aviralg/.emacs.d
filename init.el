(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(use-package counsel :ensure
  :config
  (progn (ivy-mode 1)
	 (counsel-mode 1)
	 (global-set-key (kbd "C-s") 'swiper-isearch)
	 (global-set-key (kbd "M-x") 'counsel-M-x)
	 (global-set-key (kbd "C-x C-f") 'counsel-find-file)
	 (global-set-key (kbd "M-y") 'counsel-yank-pop)
	 (global-set-key (kbd "<f1> f") 'counsel-describe-function)
	 (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
	 (global-set-key (kbd "<f1> l") 'counsel-find-library)
	 (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
	 (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
	 (global-set-key (kbd "<f2> j") 'counsel-set-variable)
	 (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
	 (global-set-key (kbd "C-c v") 'ivy-push-view)
	 (global-set-key (kbd "C-c V") 'ivy-pop-view)

	 (global-set-key (kbd "C-c c") 'counsel-compile)
	 (global-set-key (kbd "C-c g") 'counsel-git)
	 (global-set-key (kbd "C-c j") 'counsel-git-grep)
	 (global-set-key (kbd "C-c L") 'counsel-git-log)
	 (global-set-key (kbd "C-c k") 'counsel-rg)
	 (global-set-key (kbd "C-c m") 'counsel-linux-app)
	 (global-set-key (kbd "C-c n") 'counsel-fzf)
	 (global-set-key (kbd "C-x l") 'counsel-locate)
	 (global-set-key (kbd "C-c J") 'counsel-file-jump)
	 (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
	 (global-set-key (kbd "C-c w") 'counsel-wmctrl)

	 (global-set-key (kbd "C-c C-r") 'ivy-resume)
	 (global-set-key (kbd "C-c b") 'counsel-bookmark)
	 (global-set-key (kbd "C-c d") 'counsel-descbinds)
	 (global-set-key (kbd "C-c g") 'counsel-git)
	 (global-set-key (kbd "C-c o") 'counsel-outline)
	 (global-set-key (kbd "C-c t") 'counsel-load-theme)
	 (global-set-key (kbd "C-c F") 'counsel-org-file)))

(use-package hydra :ensure)


(defhydra hydra-ibuffer-main (:color pink :hint nil)
  "
 ^Navigation^ | ^Mark^        | ^Actions^        | ^View^
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
  _k_:    ʌ   | _m_: mark     | _D_: delete      | _g_: refresh
 _RET_: visit | _u_: unmark   | _S_: save        | _s_: sort
  _j_:    v   | _*_: specific | _a_: all actions | _/_: filter
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
"
  ("j" ibuffer-forward-line)
  ("RET" ibuffer-visit-buffer :color blue)
  ("k" ibuffer-backward-line)

  ("m" ibuffer-mark-forward)
  ("u" ibuffer-unmark-forward)
  ("*" hydra-ibuffer-mark/body :color blue)

  ("D" ibuffer-do-delete)
  ("S" ibuffer-do-save)
  ("a" hydra-ibuffer-action/body :color blue)

  ("g" ibuffer-update)
  ("s" hydra-ibuffer-sort/body :color blue)
  ("/" hydra-ibuffer-filter/body :color blue)

  ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
  ("q" quit-window "quit ibuffer" :color blue)
  ("." nil "toggle hydra" :color blue))

(defhydra hydra-ibuffer-mark (:color teal :columns 5
                              :after-exit (hydra-ibuffer-main/body))
  "Mark"
  ("*" ibuffer-unmark-all "unmark all")
  ("M" ibuffer-mark-by-mode "mode")
  ("m" ibuffer-mark-modified-buffers "modified")
  ("u" ibuffer-mark-unsaved-buffers "unsaved")
  ("s" ibuffer-mark-special-buffers "special")
  ("r" ibuffer-mark-read-only-buffers "read-only")
  ("/" ibuffer-mark-dired-buffers "dired")
  ("e" ibuffer-mark-dissociated-buffers "dissociated")
  ("h" ibuffer-mark-help-buffers "help")
  ("z" ibuffer-mark-compressed-file-buffers "compressed")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-action (:color teal :columns 4
                                :after-exit
                                (if (eq major-mode 'ibuffer-mode)
                                    (hydra-ibuffer-main/body)))
  "Action"
  ("A" ibuffer-do-view "view")
  ("E" ibuffer-do-eval "eval")
  ("F" ibuffer-do-shell-command-file "shell-command-file")
  ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
  ("H" ibuffer-do-view-other-frame "view-other-frame")
  ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
  ("M" ibuffer-do-toggle-modified "toggle-modified")
  ("O" ibuffer-do-occur "occur")
  ("P" ibuffer-do-print "print")
  ("Q" ibuffer-do-query-replace "query-replace")
  ("R" ibuffer-do-rename-uniquely "rename-uniquely")
  ("T" ibuffer-do-toggle-read-only "toggle-read-only")
  ("U" ibuffer-do-replace-regexp "replace-regexp")
  ("V" ibuffer-do-revert "revert")
  ("W" ibuffer-do-view-and-eval "view-and-eval")
  ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
  ("b" nil "back"))

(defhydra hydra-ibuffer-sort (:color amaranth :columns 3)
  "Sort"
  ("i" ibuffer-invert-sorting "invert")
  ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
  ("v" ibuffer-do-sort-by-recency "recently used")
  ("s" ibuffer-do-sort-by-size "size")
  ("f" ibuffer-do-sort-by-filename/process "filename")
  ("m" ibuffer-do-sort-by-major-mode "mode")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-filter (:color amaranth :columns 4)
  "Filter"
  ("m" ibuffer-filter-by-used-mode "mode")
  ("M" ibuffer-filter-by-derived-mode "derived mode")
  ("n" ibuffer-filter-by-name "name")
  ("c" ibuffer-filter-by-content "content")
  ("e" ibuffer-filter-by-predicate "predicate")
  ("f" ibuffer-filter-by-filename "filename")
  (">" ibuffer-filter-by-size-gt "size")
  ("<" ibuffer-filter-by-size-lt "size")
  ("/" ibuffer-filter-disable "disable")
  ("b" hydra-ibuffer-main/body "back" :color blue))


(defun joe-scroll-other-window()
  (interactive)
  (scroll-other-window 1))
(defun joe-scroll-other-window-down ()
  (interactive)
  (scroll-other-window-down 1))
(use-package ace-window
	     :ensure t
	     :defer 1
	     :config
	     (set-face-attribute
	      'aw-leading-char-face nil
	      :foreground "deep sky blue"
	      :weight 'bold
	      :height 3.0)
	     (set-face-attribute
	      'aw-mode-line-face nil
	      :inherit 'mode-line-buffer-id
	      :foreground "lawn green")
	     (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)
		   aw-dispatch-always t
		   aw-dispatch-alist
		   '((?x aw-delete-window "Ace - Delete Window")
		     (?c aw-swap-window "Ace - Swap Window")
		     (?n aw-flip-window)
		     (?v aw-split-window-vert "Ace - Split Vert Window")
		     (?h aw-split-window-horz "Ace - Split Horz Window")
		     (?m delete-other-windows "Ace - Maximize Window")
		     (?g delete-other-windows)
		     (?b balance-windows)
		     (?u (lambda ()
			   (progn
			     (winner-undo)
			     (setq this-command 'winner-undo))))
		     (?r winner-redo)))

	     (when (package-installed-p 'hydra)
	       (defhydra hydra-window-size (:color red)
		 "Windows size"
		 ("h" shrink-window-horizontally "shrink horizontal")
		 ("j" shrink-window "shrink vertical")
		 ("k" enlarge-window "enlarge vertical")
		 ("l" enlarge-window-horizontally "enlarge horizontal"))
	       (defhydra hydra-window-frame (:color red)
		 "Frame"
		 ("f" make-frame "new frame")
		 ("x" delete-frame "delete frame"))
	       (defhydra hydra-window-scroll (:color red)
		 "Scroll other window"
		 ("n" joe-scroll-other-window "scroll")
		 ("p" joe-scroll-other-window-down "scroll down"))
	       (add-to-list 'aw-dispatch-alist '(?w hydra-window-size/body) t)
	       (add-to-list 'aw-dispatch-alist '(?o hydra-window-scroll/body) t)
	       (add-to-list 'aw-dispatch-alist '(?\; hydra-window-frame/body) t))
	     (ace-window-display-mode t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (ace-window use-package hydra))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

