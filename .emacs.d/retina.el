(defun retina--insert-pilcrow ()
  "Insert a pilcrow at caret"
  (interactive)
  (insert-and-inherit "¶"))
(defvar retina-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-n") 'retina--insert-pilcrow)
    map))
(defun retina--init-mode-common ()
  (rainbow-delimiters-mode)
  (remove-hook 'before-save-hook 'delete-trailing-whitespace)
  )
(defun retina--configure ()
  (set (make-local-variable 'require-final-newline) nil)
  )
(define-derived-mode retina-mode prog-mode "Retina"
  "Major mode for editing Retina files"
  :group 'retina
  (use-local-map retina-mode-map)
  (retina--init-mode-common)
  (retina--configure))

(add-to-list 'auto-mode-alist '("\\.ret\\'" . retina-mode))
(add-to-list 'interpreter-mode-alist '("ret" . retina-mode))

(provide 'retina-mode)
