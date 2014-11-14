(require 'evil)
(load "~/.emacs.d/lib/cofi-util")
(require 'cofi-util)
;(add-to-loadpath "~/.emacs.d/lib/powerline/") ;make this work please
(load "~/.emacs.d/lib/powerline/powerline-separators")
(load "~/.emacs.d/lib/powerline/powerline-themes")
(load "~/.emacs.d/lib/powerline/powerline")
(require 'powerline)
(require 'powerline-themes)
(require 'powerline-separators)

(evil-mode 1)
;; (setq evilnc-comment-operator (kbd "SPC"))
;; (evilnc-default-hotkeys) ;; seems to be breaking hella shit
;; (global-evil-tabs-mode t) ;;this works, but it's kind of annoying
;; (powerline-evil-vim-color-theme)
(global-evil-surround-mode)
(powerline-evil-theme)

;; C-* for searches for the current symbol in reverse
(define-key evil-normal-state-map (kbd "C-*") 'evil-search-word-backward)

;==================================================================================================================
;==================================================================================================================
;; LEADER LEADER LEADER LEADER
;; LEADER LEADER LEADER LEADER
;; LEEEEAAAAAADERRRRRR LEAAAADEERRRRRRRR
;==================================================================================================================
;; Set leader key to the spacebar
(setq evil-leader/leader "<SPC>" ;; cool tip from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
      evil-leader/in-all-states t)
(global-evil-leader-mode)

(evil-leader/set-key
  "ag" 'ag-project
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator
  )

; <leader> W to cleanup whitespace
(evil-leader/set-key "W" 'whitespace-cleanup)

;; Magit key (RIP Fugitive)
(evil-leader/set-key "g" 'magit-status)

;; M-+ for zoom in, M-_ for zoom out (yeah, _ is shift-minus)
(define-key evil-normal-state-map (kbd "M-+") 'text-scale-increase)
(define-key evil-normal-state-map (kbd "M-_") 'text-scale-decrease)

;; map <leader> cc and <leader> dd to what I feel in my heart cc and dd should do. Which is respect paredit.
(evil-leader/set-key "cc" (lambda (arg) (interactive "P") (move-beginning-of-line arg) (paredit-kill arg) (evil-insert arg)))
(evil-leader/set-key "dd" (lambda (arg) (interactive "P") (move-beginning-of-line arg) (paredit-kill arg)))

;; <leader> ev opens a new split to edit this file.
(evil-leader/set-key "ev" (lambda (arg) (interactive "P") (evil-window-vsplit 100 "~/.emacs.d/config/evil-config.el")))

;; I wish this wasn't necessary
(define-key evil-normal-state-map (kbd ",") 'evil-repeat-find-char-reverse)

;==================================================================================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; stolen from cofi https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-evil.el
;;; evil-surround
(require-and-exec 'surround
  (setq-default surround-pairs-alist '((?\( . ("(" . ")"))
                                       (?\[ . ("[" . "]"))
                                       (?\{ . ("{" . "}"))

                                       (?\) . ("( " . " )"))
                                       (?\] . ("[ " . " ]"))
                                       (?\} . ("{ " . " }"))
                                       (?> . ("< " . " >"))

                                       (?# . ("#{" . "}"))
                                       (?p . ("(" . ")"))
                                       (?b . ("[" . "]"))
                                       (?B . ("{" . "}"))
                                       (?< . ("<" . ">"))
                                       (?t . surround-read-tag)))

  (defun cofi/surround-add-pair (trigger begin-or-fun &optional end)
    "Add a surround pair.
If `end' is nil `begin-or-fun' will be treated as a fun."
    (push (cons (if (stringp trigger)
                    (string-to-char trigger)
                  trigger)
                (if end
                    (cons begin-or-fun end)
                  begin-or-fun))
          surround-pairs-alist))

  (global-surround-mode 1)
  (add-to-hooks (lambda ()
                  (cofi/surround-add-pair "`" "`" "'"))
                '(emacs-lisp-mode-hook lisp-mode-hook))
  (add-to-hooks (lambda ()
                  (cofi/surround-add-pair "~" "``" "``"))
                '(markdown-mode-hook rst-mode-hook python-mode-hook))
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (cofi/surround-add-pair "~" "\\texttt{" "}")
                               (cofi/surround-add-pair "=" "\\verb=" "=")
                               (cofi/surround-add-pair "/" "\\emph{" "}")
                               (cofi/surround-add-pair "*" "\\textbf{" "}")
                               (cofi/surround-add-pair "P" "\\(" "\\)")))
  (add-to-hooks (lambda ()
                  (cofi/surround-add-pair "c" ":class:`" "`")
                  (cofi/surround-add-pair "f" ":func:`" "`")
                  (cofi/surround-add-pair "m" ":meth:`" "`")
                  (cofi/surround-add-pair "a" ":attr:`" "`")
                  (cofi/surround-add-pair "e" ":exc:`" "`"))
                '(rst-mode-hook python-mode-hook)))


(cl-loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                                 (ag-mode . emacs)
                                 (fundamental-mode . emacs)
                                 (nav-mode . emacs)
                                 (pylookup-mode . emacs)
                                 ;; CIDER modes
                                 (cider-docview-mode . emacs)
                                 (cider-inspector-mode . emacs)
                                 (cider-macroexpansion-mode . emacs)
                                 (cider-repl-mode . emacs)
                                 (cider-result-mode . emacs)
                                 (cider-stacktrace-mode . emacs)
                                 (cider-test-report-mode . emacs)

                                 (comint-mode . emacs)
                                 (ebib-entry-mode . emacs)
                                 (ebib-index-mode . emacs)
                                 (ebib-log-mode . emacs)
                                 (eshell-mode . emacs)
                                 (elfeed-show-mode . emacs)
                                 (elfeed-search-mode . emacs)
                                 (ensime-inf-mode . emacs)
                                 (gtags-select-mode . emacs)
                                 (git-commit-mode . emacs)
                                 (git-rebase-mode . emacs)
                                 (haskell-interactive-mode . emacs)
                                 (haskell-error-mode . emacs)
                                 (dired-mode . emacs)
                                 (shell-mode . emacs)
                                 (term-mode . emacs)
                                 (bc-menu-mode . emacs)
                                 (magit-status-mode . emacs)
                                 (magit-branch-manager-mode . emacs)
                                 (semantic-symref-results-mode . emacs)
                                 (rdictcc-buffer-mode . emacs)
                                 (erc-mode . normal))
         do (evil-set-initial-state mode state))

(fill-keymap evil-normal-state-map
             "Y" (kbd "y$")
             "+" 'evil-numbers/inc-at-pt
             "-" 'evil-numbers/dec-at-pt
             "go" 'goto-char
             "C-t" 'transpose-chars
             "C-:" 'eval-expression
             "C-u" 'evil-scroll-up
             "D" 'paredit-kill
             "C" (lambda (arg) (interactive "P") (paredit-kill arg) (evil-insert arg))
             "I" (lambda (arg) (interactive "P") (move-beginning-of-line arg) (evil-insert arg))
             ;":" 'evil-repeat-find-char-reverse
             "gH" 'evil-window-top
             "gL" 'evil-window-bottom
             "gM" 'evil-window-middle
             "H" 'beginning-of-line
             "L" 'end-of-line
             )

(fill-keymap evil-motion-state-map
             "y" 'evil-yank
             "Y" (kbd "y$")
             "_" 'evil-first-non-blank
             "C-e" 'end-of-line
             "C-S-d" 'evil-scroll-up
             "C-S-f" 'evil-scroll-page-up
             "C-y" nil)
;; end cofi ======================================================================


;; Return some Emacs conveniences to insert mode
(define-key evil-insert-state-map (kbd "C-k") 'paredit-kill)
(define-key evil-insert-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-p") 'evil-scroll-line-up)
(define-key evil-insert-state-map (kbd "C-n") 'evil-scroll-line-down)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)

;; I don't know why this is necessary:
(define-key evil-insert-state-map (kbd "C-w") 'evil-delete-backward-word)

;; move between windows like a civilized fucking human being
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)

;; remap k to gk and j to gj
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "gk") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "gj") 'evil-next-line)

(define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "gk") 'evil-previous-line)
(define-key evil-motion-state-map (kbd "gj") 'evil-next-line)

;; remap SPC and RET so that they won't be active in evil mode (since they just duplicate j and l)
(defun my-move-key (keymap-from keymap-to key)
	"Moves key binding from one keymap to another, deleting from the old location. "
	(define-key keymap-to key (lookup-key keymap-from key))
	(define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

;; Show violet box if in Emacs mode
(setq evil-emacs-state-cursor  '("violet" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("gray" bar))
(setq evil-motion-state-cursor '("gray" box))
