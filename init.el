;;TITLE: BS.Linix Emacs Config
;;Author: Brian Scott


;; THEME - We only need one.. Dracula. Ok maybe a few Doom Themes too.

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'dracula t)

(use-package doom-themes
  :init (load-theme 'doom-dracula t))

;; QUALITY OF LIFE ADDONS

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



;; We're lazy.. we don't want to type yes or no!
(use-package emacs
  :init
  (defalias 'yes-or-no-p 'y-or-n-p))


;; KEYBINDS


;;Install General and put it to work creating our own personal leader key
(use-package general
  :config
  
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)'
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
   "t" '(:ignore t :which-key "toggles")
   "tt" '(counsel-load-theme :which-key "choose theme")))





;; Lets become Evil - VIM Style Keybinds
(use-package evil
  :demand ; No Lazy loading
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :hook (evil-mode . rune/evil-hook)
  :config
  (evil-mode 1))
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; Use visual line motions even outside of visual-line mode buffers
  (evil-set-initial-state 'message-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)



;; Revisit this later
;;(use-package evil-collection
;;  :after evil
;;  :config
;;  (evil-collection-init))



;; Hydra - Streamlines repetitive commands
(use-package hydra)

(defhydra hydra-text-scale (:timeout 5)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))


;; VISUAL AIDS AND HELP(FUL)
  

;; Turn on Rainbow Delimiters Mode in Programming Mode
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))



;; Install Which-Key so we know what our options are as we give commands.
;; Use C-x which-key-mode to enable and disable which-key.
;; Adjust the delay to speed up or slow down how quickly the available keybinds show.
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2))



;; GUI ENHANCEMENTS/MINIMIZATION

(setq inhibit-startup-message t) ;; Get rid of the startup page

(scroll-bar-mode -1)     ;; Disable visible scrollbar
(menu-bar-mode -1)       ;; I'm not lost! You're lost!
(tool-bar-mode -1)       ;; Toolbar be gone!
(tooltip-mode -1)        ;; We don't need no stinkin tooltips!
(set-fringe-mode 10)     ;; Just a touch of padding. It gets cramped in here.



;; Display line numbers in certain modes
(column-number-mode t)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))



;; Install doom-modeline and nerd-icons
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package nerd-icons)



;; FONTS

(set-face-attribute 'default nil :font "FiraMono Nerd Font"
		    :height 130
		    :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "FiraCode Nerd Font"
		    :height 140
		    :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "FiraMono Nerd Font"
		    :height 130
		    :weight 'medium)
     
;; This is necessary for emac-client for fonts to look right.		       
(add-to-list 'default-frame-alist '(font . "FiraMono Nerd Font-12"))
;; This may or may not be necessary.
(setq default-line-spacing 0.12)
  


;; PACKAGES 

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)



;; Install Ivy, Ivy-Rich & Diminish - Ivy adds VIM type navigation in the mini-buffer, etc.
;;                        - Diminish removes from less-than-required info from the modeline
(use-package diminish)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))



;; Install Counsel & Swiper - Make navigating files much easier.
(use-package swiper)
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))



;; Install Helpful - incredible amount of information at our fingertips.
  (use-package helpful
    :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit evil-magit counsel-projectile councel-projectile projectile which-key use-package rainbow-delimiters ivy-rich hydra helpful general evil-collection doom-themes doom-modeline diminish counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; GIT - Projectile and MAGIT

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
   ("C-c p" . projectile-command-map)
   :init
   (when (file-directory-p "~/Projects/Debian-12-Scripts"
     (setq projectile-project-search-path '("~/Projects/Debian-12-Scripts")))
     (setq projectile-switch-project-action #'projectile-dired)))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit)

;;(use-package evil-magit
;;  :after magit)
