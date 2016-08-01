(setq opam-share
      (substring
        (shell-command-to-string "opam config var share 2> /dev/null")
        0 -1))
(add-to-list 'load-path "~/.emacs.d/tuareg")

(setq tuareg-use-smie nil)
(load "tuareg-site-file")

(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
; ocaml autocomplete via merlin
(require 'merlin)
(add-hook 'tuareg-mode-hook 'merlin-mode)
; enable auto-completing of ocaml stuff using the default keybind
(setq merlin-use-auto-complete-mode 'easy)

(global-set-key (kbd "C-i") 'completion-at-point)
