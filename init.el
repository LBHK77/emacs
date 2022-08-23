(set-frame-parameter nil 'fullscreen 'fullboth)
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

(shell-command "xrandr --output eDP1 --off")
(shell-command "feh --bg-fill ~/Pictures/wallpapers/wallpaper2.jpg")

;; picom

(shell-command "picom -b" )

;;(shell-command "picom --blur-method kernel --backend glx --experimental-backends --blur-kern '15,15,0.0,0.0,0.0,5.2128623625220705,17.00896879022241,25.2326840508547,29.464967285727013,29.464967285727013,25.2326840508547,17.00896879022241,5.2128623625220705,0.0,0.0,0.0,0.0,0.0,0.0,15.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,15.0,0.0,0.0,0.0,0.0,17.00896879022241,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,17.00896879022241,0.0,0.0,11.03493716289379,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,11.03493716289379,0.0,25.2326840508547,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,25.2326840508547,7.1373795560996385,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,13.008810743676655,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,15.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,13.008810743676655,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,7.1373795560996385,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,0.0,25.2326840508547,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,25.2326840508547,0.0,11.03493716289379,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,11.03493716289379,0.0,0.0,17.00896879022241,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,17.00896879022241,0.0,0.0,0.0,0.0,15.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,15.0,0.0,0.0,0.0,0.0,0.0,0.0,5.2128623625220705,17.00896879022241,25.2326840508547,29.464967285727013,29.464967285727013,25.2326840508547,17.00896879022241,5.2128623625220705,0.0,0.0,0.0' -b" )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package
   '(ement :type git :host github :repo "alphapapa/ement.el"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'ir-black t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("f5dd054d9b18c955b3b2bca2f076955e74dcc564f45a093ddf984bdc5b2678d3" default))
 '(warning-suppress-log-types '((comp) (comp) (comp) (comp) (comp)))
 '(warning-suppress-types '((comp) (comp) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-divider ((t (:foreground "dim gray")))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))
(set-face-foreground 'vertical-border "DarkSlateGrey")

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
(defalias 'ido-find-file 'find-file) ; make find-file default

(setq w3m-default-display-inline-images t)

(global-set-key (kbd "C-x C-e") 'eshell)
