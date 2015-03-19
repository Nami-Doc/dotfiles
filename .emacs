;; -*- lexical-binding: t -*-
(load-file (let ((coding-system-for-read 'utf-8))
                             (shell-command-to-string "agda-mode locate")))

;; packages
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

;; os x custom

;; - these are handled by the terminal's config "use option as meta"
;;(setq mac-option-key-is-meta t
;;      mac-option-modifier 'meta)

;; slime
;(setq inferior-lisp-program "sbcl")
;(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; evil mode
(evil-mode 1)

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

(define-key evil-motion-state-map (kbd "`") 'execute-extended-command)

;; use : instead of ; and ; instead of :
(dolist (state-map (list evil-normal-state-map evil-visual-state-map))
  (define-key state-map (kbd ";") 'evil-ex)
  (define-key state-map (kbd ":") 'evil-repeat-find-char))

;; agda2-mode
(global-set-key (kbd "C-c ,") 'agda2-goal-and-context)
(global-set-key (kbd "C-c .") 'agda2-goal-and-context-and-inferred)
(global-set-key (kbd "C-c C-@") 'agda2-give)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("/Users/ven/os/agda/agda-stdlib/src" ".")))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil))

;; insert weird chars
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
