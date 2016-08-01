;; remove toolbars and stuff
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(electric-indent-mode +1)

;; y/n is ALWAYS enough.
(defalias 'yes-or-no-p 'y-or-n-p)

;; don't change current directory when opening a new file. thanks @rightfold
(add-hook 'find-file-hook
          (lambda ()
            (setq default-directory command-line-default-directory)))

;; grrr indentation
(setq-default tab-width 2)

;; trim whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; make opt key do Super
(setq mac-option-modifier 'super)
