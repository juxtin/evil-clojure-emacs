;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Molokai theme
(load "~/.emacs.d/lib/molokai-theme/molokai-theme")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Monokai theme
;; (load "~/.emacs.d/lib/monokai-emacs/monokai-theme")
;; (load-theme 'monokai t)

(linum-mode)
;; (global-hl-line-mode)

;; Disable toolbars
(tool-bar-mode -1)

;; Git gutter fringe
(global-git-gutter+-mode t)
(require 'git-gutter-fringe+)

(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)
;; set transparency
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(98 85))
(add-to-list 'default-frame-alist '(alpha 90 85))

;; replace selection when yanking
(delete-selection-mode)

;; company-mode customization
(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; linum-relative doesn't provide a nice way to customize this.
(defface linum-relative-current-face
  '((t :inherit linum :foreground "DarkOrange2" :background "grey11" :weight bold))
  "Face for displaying current line."
  :group 'linum-relative)

;; Move focus to new split (duh)
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

;; font stuff
(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-16"))
(set-frame-font "Ubuntu Mono-17" nil t)

;; window size http://www.jesshamrick.com/2013/03/31/macs-and-emacs/
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 35))
  (add-to-list 'default-frame-alist '(width . 150)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; Fix popups by disabling them. Otherwise they crash emacs!
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

;; Disable overeager scrolling
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Ignore prompt when killing a process
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Display date and time in status bar
(setq display-time-day-and-date t)
(display-time)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Don't allow shell prompt to be deleted
(setq comint-prompt-read-only t)

;; Don't echo line in comint-mode
(defun echo-false-comint ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'echo-false-comint)

(require 'linum-relative)
;; (setq linum-relative-current-symbol "->")
(setq linum-relative-current-symbol "") ;; just show the current (absolute) line number
(global-linum-mode)
