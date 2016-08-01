;; magit is our only VCS manager
(setq vc-handled-backends nil)

;; evil leader
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
