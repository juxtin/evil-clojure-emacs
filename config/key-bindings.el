;; RMS is wrong about sentences.
(setq sentence-end-double-space nil)

;; command-` should cycle frames as per the rest of OS X
(global-set-key (kbd "M-`") 'other-frame)

;; Command+option+n for new frame
(global-set-key (kbd "M-s-n") 'make-frame)

;; Command+option+w to close a frame
(global-set-key (kbd "M-s-w") 'delete-frame)

;; s-f to visit file/url under point
(global-set-key (kbd "s-f") 'ffap)

;; map s-h to helpy things
(global-set-key (kbd "s-h") 'help)

;; expand-region is cool
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Better buffer nav
(global-set-key (kbd "s-<right>") 'next-buffer)
(global-set-key (kbd "s-<left>") 'previous-buffer)

;; ERC buffer nav
(global-set-key (kbd "M-s-<left>") 'prev-erc-buffer)
(global-set-key (kbd "M-s-<right>") 'next-erc-buffer)

;; Hotkey for magit-status
(global-set-key (kbd "s-s") 'magit-status)

;; M-u to toggle transparency
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(90 85))))
(global-set-key (kbd "M-u") 'toggle-transparency)

;; remap mac modifier keys
(setq mac-option-key-is-meta nil
      mac-command-key-ismeta t
      mac-command-modifier 'meta
      mac-option-modifier 'super)

;; FUCK the default super mappings. I need better window movement.
(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-j") 'windmove-down)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-l") 'windmove-right)

