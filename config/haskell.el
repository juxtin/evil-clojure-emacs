;; Indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Use return like a real person
(add-hook 'haskell-mode-hook
          (lambda ()
            (define-key evil-insert-state-map (kbd "RET") 'newline)))

;; F8 to navigate imports
(eval-after-load 'haskell-mode
          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

;; Use hasktags
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'exec-path "~/Library/Haskell/bin")
(custom-set-variables '(haskell-tags-on-save t))

;; A bunch of interactive shite
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;; Use cabal's REPL instead of ghci
(custom-set-variables '(haskell-process-type 'cabal-repl))

;; Yo what up ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; autocomlete
(eval-after-load 'company '(add-to-list 'company-backends 'company-ghc))
(custom-set-variables '(company-ghc-show-info t))
