;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Emacs Macros Handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun save-macro (name)
  "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
  (interactive "SName of the macro :")  ; ask for the name of the macro
  (kmacro-name-last-macro name)         ; use this name for the macro
  (find-file "c:/users/flcuser/.emacs.d/macros.el") ; open ~/.emacs or other user init file
  (goto-char (point-max))               ; go to the end of the .emacs
  (newline)                             ; insert a newline
  (insert-kbd-macro name)               ; copy the macro
  (newline)                             ; insert a newline
  (switch-to-buffer nil))               ; return to the initial buffer

(fset 'go-to-func-params
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217736 21 48 134217848 114 101 99 101 110 116 101 114 return 7] 0 "%d")) arg)))

(global-set-key (kbd "C-c s l") (lambda () (interactive) (go-to-func-params) (down-list)))

(fset 'find-functions-calling-this-function
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 99 45 109 97 114 107 45 102 117 110 99 116 105 111 110 return right left 19 40 134217826 134217848 99 115 99 111 112 101 45 102 105 110 100 45 102 117 110 99 116 105 111 110 115 45 99 97 108 108 105 110 103 45 116 104 105 115 45 102 117 110 99 116 105 111 110 return return] 0 "%d")) arg)))
(global-set-key (kbd "C-c s h") (lambda () (interactive) (find-functions-calling-this-function)))

(fset 'imenu-current-symbol
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 105 109 101 110 117 return return] 0 "%d")) arg)))

(fset 'imenu-goto-current-symbol
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 105 109 101 110 117 return return 134217736 12 12 7] 0 "%d")) arg)))

(global-set-key (kbd "M-r") (lambda () (interactive) (imenu-goto-current-symbol)))
