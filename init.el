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
(load "~/.emacs.d/config/haskell")
(load "~/.emacs.d/config/clj")
(load "~/.emacs.d/config/ag")
(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(company-idle-delay 0.2)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(initial-buffer-choice t)
 '(vc-follow-symlinks nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1b1d1e" :foreground "#f8f8f0"))))
 '(company-scrollbar-bg ((t (:background "#2d3031"))))
 '(company-tooltip ((t (:inherit default :background "#191b1c"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))
