; common lisp indent
(put 'if 'lisp-indent-function nil)
(put 'when 'lisp-indent-function 1)
(put 'unless 'lisp-indent-function 1)
(put 'do 'lisp-indent-function 2)
(put 'do* 'lisp-indent-function 2)
(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)))
