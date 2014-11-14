(require 'evil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun new-lein-project (name &optional template)
  "Interactively ask for a project and optional template name, then creates a
  Leiningen project with the parameters. Opens the project.clj file."
  (interactive "sProject name: \nMTemplate (optional): ")
  (shell-command-to-string
    (concat "cd ~/src && "
            "lein new "
            template
            " " name))
  (find-file (concat "~/src/" name "/project.clj")))

(defun helm-clojure-headlines ()
  "Display headlines for the current Clojure file."
  (interactive)
  (helm-mode t)
  (jit-lock-fontify-now) ;; https://groups.google.com/forum/#!topic/emacs-helm/YwqsyRRHjY4
  (helm :sources '(((name . "Clojure Headlines")
                    (volatile)
                    (headline "^(\\|testing\\|^;.*[A-Za-z]+")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Minor mode definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-minor-mode always-be-clojing-mode
  "Additional customizations for Clojure by Justin Holguin."
  :lighter " ABClj"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c h") 'helm-clojure-headlines)
            map)
  (evil-leader/set-key-for-mode 'always-be-clojing-mode "h" 'helm-clojure-headlines)
  (evil-leader/set-key-for-mode 'always-be-clojing-mode "sp" "i#spy/p <ESC>")
  (evil-leader/set-key-for-mode 'always-be-clojing-mode "sd" "i#spy/d <ESC>")
  (evil-leader/set-key-for-mode 'always-be-clojing-mode "st" "i#spy/t <ESC>")

  (fill-keymap evil-normal-state-local-map
    "M-." 'cider-jump-to-var
    "M-," 'cider-jump-back
    "C-c h" 'helm-clojure-headlines
    "C-c C-d g" 'cider-grimoire-web
    "C-c C-d j" 'cider-docview-javadoc)
  ;; (define-key evil-normal-state-local-map (kbd "M-.") 'cider-jump-to-var)
  (define-key evil-insert-state-local-map (kbd "RET") 'paredit-newline)
  
  ;; other customizations
  ;;
  ;; break -> and ->> so Dan will be happy
  (define-clojure-indent
    (->  1)
    (->> 1))
  
  ;; preserve "proper" two-space indentation when functions are on their own lines
;  (setq lisp-indent-offset 2)
  )

(add-hook 'clojure-mode-hook 'always-be-clojing-mode)

(provide 'always-be-clojing-mode)
