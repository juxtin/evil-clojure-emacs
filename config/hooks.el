(global-auto-complete-mode -1) ;; ac-mode seems to suck
(add-hook 'after-init-hook 'global-company-mode) ;; company-mode supposedly does not suck

(defun disable-company-mode () ;; but I don't want it in every mode
  (setq company-mode nil))

(add-hook 'markdown-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'markdown-mode-hook         #'enable-paredit-mode)
(add-hook 'markdown-mode-hook         #'disable-company-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'haskell-mode-hook          #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook    #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'rainbow-delimiters-mode)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Recognize markdown files
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
