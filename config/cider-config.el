;; experimentally re-enabling this:
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; this might make the REPL prettier
(setq cider-repl-use-clojure-font-lock t)

(setq nrepl-hide-special-buffers t)
(global-set-key (kbd "C-c n e b") 'cider-eval-buffer)

;; Pretty printing
(add-hook 'cider-repl-mode-hook 'cider-repl-toggle-pretty-printing)

;;================================================================================
;; Disabling ac-shit because it sucks ============================================
;;================================================================================

;; ;; Popup autocomplete
;; (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
;; (add-hook 'cider-mode-hook 'ac-nrepl-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))

;; ;; Trigger AC with TAB does this break things
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))

;; ===============================================================================
;; ac-nrepl docs maybe don't suck ================================================
;; ===============================================================================
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

