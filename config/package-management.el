(defvar my-packages
  '(ac-nrepl anaphora auctex auctex-latexmk auto-complete better-defaults change-inner cider cl cl-lib clojure-mode clojurescript-mode cm-mode company diminish eldoc elscreen ensime erc-tweet evil evil-leader evil-nerd-commenter evil-numbers evil-surround expand-region flx-ido flycheck fringe-helper git-gutter+ git-gutter-fringe+ helm hy-mode ido-ubiquitous latex-extra latex-pretty-symbols latex-preview-pane linum-relative magit markdown-mode paredit puppet-mode pretty-lambdada markdown-mode rainbow-delimiters scala-mode2 slamhound smex)
  "A list of packages to ensure are installed at launch.")

;; M-h v package-activated-list RET
;; package-activated-list is a variable defined in `package.el'.
;; Its value is
;; (anaphora change-inner color-theme-molokai dash-at-point erc-image erc-tweet expand-region hy-mode use-package diminish bind-key)

;; add package management
(require 'package)
;; add sources
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/") ;I usually leave this commented out
                  ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                  ("gnu" . "http://elpa.gnu.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Not strictly package management, but hey:
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:/usr/texbin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
