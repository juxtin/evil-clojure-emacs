(defun esk-pretty-fn ()
    (font-lock-add-keywords nil `(("(\\(\\<fn\\>\\)"
                                   (0 (progn (compose-region (match-beginning 1)
                                                             (match-end 1)
                                                             "\u03BB"
                                                             'decompose-region)))))))

(add-hook 'clojure-mode-hook 'esk-pretty-fn)
(add-hook 'clojurescript-mode-hook 'esk-pretty-fn)

;; (global-pretty-lambda-mode)
