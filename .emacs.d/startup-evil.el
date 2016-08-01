;; evil leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; evil-args
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

;; add vim-like tabs, because they're good
(global-evil-tabs-mode t)
;; add a binding to open a new tab with a buffer
(evil-define-command elscreen-create-and-open (&optional filename)
  (interactive "<f>")
  (elscreen-create)
  (if filename
    (evil-edit filename)))
(evil-ex-define-cmd "n" 'elscreen-create-and-open)
(evil-ex-define-cmd "ne" 'elscreen-create-and-open)


;; thou shall be strong and not use those.
(define-key evil-motion-state-map [left] 'undefined)
(define-key evil-motion-state-map [right] 'undefined)
(define-key evil-motion-state-map [up] 'undefined)
(define-key evil-motion-state-map [down] 'undefined)

;; use :help instead of C-h.
(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
(define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
(define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "C-l") 'forward-char)

(define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; use : instead of ; and ; instead of :
(dolist (state-map edit-state-maps)
  (define-key state-map (kbd ";") 'evil-ex)
  (define-key state-map (kbd ":") 'evil-repeat-find-char)

  ;; switching buffers is annoying...
  (define-key state-map (kbd "C-c b") 'switch-to-previous-buffer)
  
  )

;; visual lines, not hard lines
(define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)

