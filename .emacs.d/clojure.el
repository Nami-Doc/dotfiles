; refactor
(require 'clj-refactor)
(defun clj-refactor-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (cljr-add-keybindings-with-prefix "C-c k"))
(add-hook 'clojure-mode-hook #'clj-refactor-hook)
; paredit
(load "paredit")
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
; paredit+evil
(add-hook 'clojure-mode-hook #'evil-paredit-mode)
; move an expression "up" (from http://emacs.stackexchange.com/questions/12799/move-form-up-and-down-on-paredit-mode )
; NOTE: this is *VERY* imperfect. (transpose-sexps, the original version, requires you to be after the expression you want to move down...)
(defun reverse-transpose-sexps (arg)
  (interactive "*p")
  (transpose-sexps (- arg))
  ;; when transpose-sexps can no longer transpose, it throws an error and code
  ;; below this line won't be executed. So, we don't have to worry about side
  ;; effects of backward-sexp and forward-sexp.
  (backward-sexp (1+ arg))
  (forward-sexp 1))
; comment the sexp under the cursor (without needing visual mode)
; from http://stackoverflow.com/questions/4288339/how-do-you-comment-out-all-or-part-of-a-lisp-s-exp-using-paredit
(defun comment-sexp ()
  "Comment out the sexp at point."
  (interactive)
  (save-excursion
    (mark-sexp)
    (paredit-comment-dwim)))
; my own stuff...

(add-hook 'clojure-mode-hook
          (lambda ()
            (rainbow-delimiters-mode)

            ; enable window movements while in CIDER
            (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
            (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
            (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
            (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

            (dolist (state-map all-state-maps)
              ; add some paredit commands
              (define-key state-map (kbd "C-d") nil)

              ; moves
              (define-key state-map (kbd "C-d h") 'paredit-backward)
              (define-key state-map (kbd "C-d j") 'paredit-forward-down)
              (define-key state-map (kbd "C-d k") 'paredit-backward-up)
              (define-key state-map (kbd "C-d l") 'paredit-forward)

              ; create-kill
              (define-key state-map (kbd "C-d c") 'paredit-close-round-and-newline)
              (define-key state-map (kbd "C-d x") 'paredit-kill)

              ; mnemonic: "in" "out"
              (define-key state-map (kbd "C-d i") 'paredit-forward-slurp-sexp)
              (define-key state-map (kbd "C-d o") 'paredit-forward-barf-sexp)

              ; mnemonic: "wrap"/unwrap
              (define-key state-map (kbd "C-d w") 'paredit-wrap-round)
              (define-key state-map (kbd "C-d r") 'paredit-splice-sexp)

              ; mnemonic: "extract" (using clj-refactor)
              (define-key state-map (kbd "C-d e") 'cljr-raise-sexp)

              ; splice-kill
              (define-key state-map (kbd "C-d a") 'paredit-splice-sexp-killing-backward)
              (define-key state-map (kbd "C-d s") 'paredit-splice-sexp-killing-forward)

              ; join-split
              (define-key state-map (kbd "C-d n") 'paredit-join-sexps)
              (define-key state-map (kbd "C-d m") 'paredit-split-sexp)

              ; move up/down
              (define-key state-map (kbd "C-d y") 'transpose-sexps)
              (define-key state-map (kbd "C-d u") 'reverse-transpose-sexps)

              ; comment
              (define-key state-map (kbd "C-d r") 'comment-sexp)
              )))
