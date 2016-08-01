;; we want evil's :q to try and close windows if they are split,
;; instead of always closing the whole tab
;; url: https://zuttobenkyou.wordpress.com/2012/06/15/emacs-vimlike-tabwindow-navigation/
(defun vimlike-quit ()
  "Vimlike ':q' behavior: close current window if there are split windows;
  otherwise, close current tab (elscreen)."
  (interactive)
  (let ((one-elscreen (elscreen-one-screen-p))
        (one-window (one-window-p)))
    (cond
      ; if current tab has split windows in it, close the current live window
      ((not one-window)
       (delete-window) ; delete the current window
       (balance-windows) ; balance remaining windows
       nil)
      ; if there are multiple elscreens (tabs), close the current elscreen
      ((not one-elscreen)
       (elscreen-kill)
       nil)
      ; if there is only one elscreen, just try to quit (calling elscreen-kill
      ; will not work, because elscreen-kill fails if there is only one
      ; elscreen)
      (one-elscreen
        (evil-quit)
        nil)
      )))
(evil-ex-define-cmd "q" 'vimlike-quit)
