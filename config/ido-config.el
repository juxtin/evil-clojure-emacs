(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode)

(setq ido-ignore-files (append
                        ido-ignore-files
                        '(
                          "^auto/$"
                          "\.o/$"
                          "\.bin/$"
                          "\.elc/$"
                          "\.un~/$"
                          "\.swp/$"
                          "\.swo/$"
                          "_region_"
                          )))
(setq ido-use-filename-at-point 'guess)

;; Used to create throwaway buffers without annoying prompts
(setq ido-create-new-buffer 'always)

;; Use Smex for fun times
;; don't load it until needed.
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))
;; Use M-x for smex
(global-set-key (kbd "M-x") 'smex)
