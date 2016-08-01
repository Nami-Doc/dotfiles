;; -*- lexical-binding: t -*-

;; agda [disabled]
  ;(let ((coding-system-for-read 'utf-8))
	;     (shell-command-to-string "agda-mode locate")))

;; packages
(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(setq package-list
      (list
        'helm               ; completion framework
        'flx                ; fuzzy searching
        'projectile         ; file navigation
        'helm-flx           ; flx integration into helm
        'helm-projectile    ; projectile integration into helm

        'magit              ; git integration
        'paredit            ; structural sexp editing
        'elscreen           ; tabs
        'multiple-cursors   ; ST-like multiple cursors
        'rainbow-delimiters ; rainbowy parens/braces/...

        'evil               ; vim keybindings
        'evil-args          ; "caa", "cia" to edit 'around' args
        'evil-leader        ; vim-like leader
        'evil-paredit       ; paredit integration with evil
        'evil-tabs          ; elscreen integration with evil

        'go-mode            ; golang mode
        'gnu-apl-mode       ; apl mode
        'haskell-mode       ; haskell mode
        'jade-mode          ; jade mode
        'js2-mode           ; ES6+ js mode
        'nim-mode           ; Nim mode
        'rust-mode          ; Rust mode
        'racket-mode        ; Racket mode

        'cider              ; clojure REPL integration
        'clj-refactor       ; clojure refactoring tools

        ; unused
        ;'hydra              ; keybinding "families" with a prefix
        ))

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; evil mode <3
(evil-mode 1)
;; simpler way to reference state maps where we want to rebind everything
(setq all-state-maps (list evil-normal-state-map evil-visual-state-map evil-insert-state-map))
;; the state maps that are edit... which means they are not insert
(setq edit-state-maps (list evil-normal-state-map evil-visual-state-map))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/startup.el")
(load "~/.emacs.d/startup-evil.el")
(load "~/.emacs.d/magit.el")
(load "~/.emacs.d/helm-flx.el")
(load "~/.emacs.d/projectile.el")
(load "~/.emacs.d/mouse.el")
(load "~/.emacs.d/vimquit.el")

(load "~/.emacs.d/c.el")
(load "~/.emacs.d/clojure.el")
(load "~/.emacs.d/coffee.el")
(load "~/.emacs.d/common-lisp.el")
(load "~/.emacs.d/ocaml.el")
(load "~/.emacs.d/retina.el")
(load "~/.emacs.d/rust.el")
