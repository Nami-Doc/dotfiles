; Projectile itself
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(require 'helm-projectile)
(helm-projectile-on)

; from https://github.com/hatschipuh/helm-better-defaults
; -- The following snippet will configure helm to always pop up at the bottom.
(setq helm-split-window-in-side-p t)
(add-to-list 'display-buffer-alist
             '("\\`\\*helm.*\\*\\'"
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.3)))
(setq helm-swoop-split-with-multiple-windows nil
      helm-swoop-split-direction 'split-window-vertically
      helm-swoop-split-window-function 'helm-default-display-buffer)
; -- end

; helm keybindings
(evil-leader/set-key
  "f" 'helm-projectile-find-file)
(dolist (state-map all-state-maps)
  ;(define-key state-map (kbd "C-f") 'helm-projectile-find-file) ; this is also `C-c p f` by default
  (define-key state-map (kbd "C-x f") 'helm-projectile-find-other-file) ; by default, `C-x f` is `set-fill-column`
  )

