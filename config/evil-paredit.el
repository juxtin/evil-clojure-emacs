;; Redefining EVIL to be more Paredit-friendly

(evil-define-operator evil-delete (beg end type register yank-handler)
  "Altered to respect paredit! -JHH
   Delete text from BEG to END with TYPE.
   Save in REGISTER or in the kill-ring with YANK-HANDLER."
  (interactive "<R><x><y>")
  (unless register
    (let ((text (filter-buffer-substring beg end)))
      (unless (string-match-p "\n" text)
        ;; set the small delete register
        (evil-set-register ?- text))))
  (let ((evil-was-yanked-without-register nil))
    (evil-yank beg end type register yank-handler))
  (cond
   ((eq type 'block)
    (evil-apply-on-block #'paredit-delete-region beg end nil))
   ((and (eq type 'line)
         (= end (point-max))
         (or (= beg end)
             (/= (char-before end) ?\n))
         (/= beg (point-min))
         (=  (char-before beg) ?\n))
    (paredit-delete-region (1- beg) end))
   (t
    (paredit-delete-region beg end)))
  ;; place cursor on beginning of line
  (when (and (evil-called-interactively-p)
             (eq type 'line))
    (evil-first-non-blank)))

(evil-define-operator evil-delete-whole-line
  (beg end type register yank-handler)
  "Delete whole line."
  :motion evil-line
  (interactive "<R><x>")
  (display-message-or-buffer "Deleting whole line")
  ;(evil-delete beg end type register yank-handler)
  (move-beginning-of-line)
  (paredit-delete-region beg end)
  )
