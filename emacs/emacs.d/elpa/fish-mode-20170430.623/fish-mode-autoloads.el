;;; fish-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "fish-mode" "fish-mode.el" (22795 18345 45053
;;;;;;  932000))
;;; Generated autoloads from fish-mode.el

(autoload 'fish_indent-before-save "fish-mode" "\


\(fn)" t nil)

(autoload 'fish-mode "fish-mode" "\
Major mode for editing fish shell files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.fish\\'" . fish-mode))

(add-to-list 'auto-mode-alist '("/fish_funced\\..*\\'" . fish-mode))

(add-to-list 'interpreter-mode-alist '("fish" . fish-mode))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; fish-mode-autoloads.el ends here
