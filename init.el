
;; -- EMACS CONFIG --

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- exwm --

(set-frame-parameter nil 'fullscreen 'fullboth)
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- appeareance --

; theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'catppuccin t)
'(window-divider ((t (:foreground "dim gray"))))

; all-the-icons

(require 'all-the-icons)
(require 'all-the-icons-dired)
(require 'all-the-icons-ibuffer)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(add-hook 'ibuffer-mode-hook 'all-the-icons-ibuffer-mode)

; modeline

(doom-modeline-mode)
(display-time-mode)

; dashboard

(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq dashboard-banner-logo-title "-- [ future.isDeclarative = true; (Lambda be like:) ] --")
(setq dashboard-startup-banner "~/.emacs.d/nixos.png")
(setq dashboard-center-content t)
(setq dashboard-set-heading-icons t)
;;(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

; disabling menu bar

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; transparency

(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

; vertical-border color

 ;;(set-face-foreground 'vertical-border "DarkSlateGrey")

; line numbers

(global-display-line-numbers-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- packages --

; package-selected-packages

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile evil olivetti dashboard nix-modeline all-the-icons-ibuffer all-the-icons-dired all-the-icons doom-modeline jabber el-fetch w3m nix-mode exwm)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; melpa 

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; quelpa

(package-install 'quelpa-use-package)
(require 'quelpa-use-package)

(use-package ement
  :quelpa (ement :fetcher github :repo "alphapapa/ement.el") ; install element
  )

; packages config

(setq w3m-default-display-inline-images t) ; w3m


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- miscelaneous --


; aliases and keys

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
(defalias 'ido-find-file 'find-file) ; make find-file default
(global-set-key (kbd "C-x C-e") 'eshell)

; eshell prompt

(setq eshell-prompt-function (lambda nil
  (concat
   (propertize (eshell/pwd) 'face `(:foreground "thistle"))
   (propertize " > " 'face `(:foreground "plum")))))
(setq eshell-highlight-prompt nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- shell commands at startup --

(shell-command "xrandr --output eDP1 --off")
(shell-command "feh --bg-fill ~/.emacs.d/wallpaper.jpg")

