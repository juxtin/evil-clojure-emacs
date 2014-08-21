(setq load-prefer-newer t) ;; trying to fix "source file newer than byte compiled file" errors

(load "~/.emacs.d/config/package-management")
(load "~/.emacs.d/config/key-bindings")
(load "~/.emacs.d/config/ido-config")
(load "~/.emacs.d/config/cider-config")
(load "~/.emacs.d/config/paredit-config")
(load "~/.emacs.d/config/pretty")
(load "~/.emacs.d/config/hooks")
(load "~/.emacs.d/config/latex-config")
(load "~/.emacs.d/config/evil-config")
(load "~/.emacs.d/config/evil-paredit")
(load "~/.emacs.d/config/gui-settings")
(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1b1d1e" :foreground "#f8f8f0")))))
