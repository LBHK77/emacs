
;; -- EMACS CONFIG --

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- appeareance --

; theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'ir-black t)
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
   '(projectile evil olivetti dashboard all-the-icons-ibuffer all-the-icons-dired all-the-icons doom-modeline jabber el-fetch w3m exwm)))

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

; straight


;(defvar bootstrap-version)
;(let ((bootstrap-file
;       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;      (bootstrap-version 5))
;  (unless (file-exists-p bootstrap-file)
;    (with-current-buffer
;        (url-retrieve-synchronously
;         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;         'silent 'inhibit-cookies)
;      (goto-char (point-max))
;      (eval-print-last-sexp)))
;  (load bootstrap-file nil 'nomessage))
;(setq package-enable-at-startup nil)
;
;(straight-use-package
; '(ement :type git :host github :repo "alphapa/ement.el"))
;
; packages config
;
;(setq w3m-default-display-inline-images t) ; w3m


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -- miscelaneous --


(electric-pair-mode)

; aliases and keys

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
(defalias 'ido-find-file 'find-file) ; make find-file default
(global-set-key (kbd "C-x e") 'eshell)

; eshell prompt

(setq eshell-prompt-function (lambda nil
  (concat
   (propertize (eshell/pwd) 'face `(:foreground "thistle"))
   (propertize " > " 'face `(:foreground "plum")))))
(setq eshell-highlight-prompt nil)
