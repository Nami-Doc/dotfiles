;; -*- lexical-binding: t -*-

;; agda [disabled]
  ;(let ((coding-system-for-read 'utf-8))
	;     (shell-command-to-string "agda-mode locate")))

;; packages
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

;; don't change current directory when opening a new file. thanks @rightfold
(add-hook 'find-file-hook
          (lambda ()
            (setq default-directory command-line-default-directory)))

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

<<<<<<< HEAD
;; grrr indentation
(setq-default tab-width 2)
(electric-indent-mode +1)

;; y/n is ALWAYS enough.
(defalias 'yes-or-no-p 'y-or-n-p)

;; trim whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ocaml: tuareg + merlin
; default indentation mode is... weird
(setq opam-share
      (substring
        (shell-command-to-string "opam config var share 2> /dev/null")
        0 -1))
(add-to-list 'load-path "~/.emacs.d/tuareg")

(setq tuareg-use-smie nil)
(load "tuareg-site-file")

(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)
(add-hook 'tuareg-mode-hook 'merlin-mode)
; enable auto-completing of ocaml stuff using the default keybind
(setq merlin-use-auto-complete-mode 'easy)

(global-set-key (kbd "C-i") 'completion-at-point)

;; slime [disabled unless needed]

;; grrr indentation
(setq-default tab-width 2)
(electric-indent-mode +1)

;; y/n is ALWAYS enough.
(defalias 'yes-or-no-p 'y-or-n-p)

;; trim whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; slime [disabled]
>>>>>>> 7ee508dc0eff048a047b1eb9b142182b5a48ea7b
;(setq inferior-lisp-program "sbcl")
;(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; evil mode
(global-evil-leader-mode)
(evil-mode 1)

;; bind evil-args
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)

(define-key evil-normal-state-map "K" 'evil-jump-out-args)

;; evil leader
(evil-leader/set-leader ",")
(evil-leader/set-key
  "g" 'magit-status)

;; magit/... evil-integration
(add-to-list 'load-path "~/.emacs.d/evil-rebellion/")
(load "evil-rebellion")

;; magit fixes (for evil)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(add-hook 'magit-mode-hook
          (lambda ()
            (local-set-key (kbd "<escape>") 'magit-mode-quit-window)))

;; add vim-like tabs, because they're good
(global-evil-tabs-mode t)
;; add a binding to open a new tab with a buffer
;; TODO remove this when evil-tabs PR gets merged
(evil-define-command elscreen-create-and-open (&optional filename)
  (interactive "<f>")
  (elscreen-create)
  (if filename
    (evil-edit filename)))
(evil-ex-define-cmd "n" 'elscreen-create-and-open)

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

;; ?? document this. forces normal mode after.. "insert and ex"?
(evil-define-command evil-insert-and-ex ()
  (evil-force-normal-state)
  (evil-ex))

;; use : instead of ; and ; instead of :
(dolist (state-map (list evil-normal-state-map evil-visual-state-map))
  (define-key state-map (kbd ";") 'evil-ex)
  (define-key state-map (kbd ":") 'evil-repeat-find-char)
  (define-key state-map (kbd "C-;") 'evil-insert-and-ex)) ; :((((

;; visual lines, not hard lines
(define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)

;; agda2-mode [disabled]
;(global-set-key (kbd "C-c ,") 'agda2-goal-and-context)
;(global-set-key (kbd "C-c .") 'agda2-goal-and-context-and-inferred)
;(global-set-key (kbd "C-c C-@") 'agda2-give)

;; rust stuff
(setq-default rust-indent-offset 2)

;; coffee stuff
(setq-default coffee-indent-tabs-mode t)
(setq-default coffee-tab-width 2)

 ;; hide elscreen junk in tab names
 ;;'(elscreen-tab-display-control nil)
 ;;'(elscreen-tab-display-kill-screen nil)

 ;; split on the right, not on the left
 ;;'(evil-vsplit-window-right t)

 ;; we don't need to always enforce this...
 ;;'(require-final-newline nil)


;; alt/option = emacs super
(setq mac-option-modifier 'super) ; make opt key do Super

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
