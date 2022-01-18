;;; tramp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "tramp" "tramp.el" (24324 35929 0 0))
;;; Generated autoloads from tramp.el

(defvar tramp-mode t "\
Whether Tramp is enabled.
If it is set to nil, all remote file names are used literally.")

(custom-autoload 'tramp-mode "tramp" t)

(defconst tramp-initial-file-name-regexp "\\`/[^/:]+:[^/:]*:" "\
Value for `tramp-file-name-regexp' for autoload.
It must match the initial `tramp-syntax' settings.")

(defvar tramp-file-name-regexp tramp-initial-file-name-regexp "\
Regular expression matching file names handled by Tramp.
This regexp should match Tramp file names but no other file
names.  When calling `tramp-register-file-name-handlers', the
initial value is overwritten by the car of `tramp-file-name-structure'.")

(defvar tramp-ignored-file-name-regexp nil "\
Regular expression matching file names that are not under Tramp's control.")

(custom-autoload 'tramp-ignored-file-name-regexp "tramp" t)

(defconst tramp-autoload-file-name-regexp (concat "\\`/" (if (memq system-type '(cygwin windows-nt)) "\\(-\\|[^/|:]\\{2,\\}\\)" "[^/|:]+") ":") "\
Regular expression matching file names handled by Tramp autoload.
It must match the initial `tramp-syntax' settings.  It should not
match file names at root of the underlying local file system,
like \"/sys\" or \"/C:\".")

(defun tramp-autoload-file-name-handler (operation &rest args) "\
Load Tramp file name handler, and perform OPERATION." (tramp-unload-file-name-handlers) (if tramp-mode (let ((default-directory temporary-file-directory)) (load "tramp" (quote noerror) (quote nomessage)))) (apply operation args))

(defun tramp-register-autoload-file-name-handlers nil "\
Add Tramp file name handlers to `file-name-handler-alist' during autoload." (add-to-list (quote file-name-handler-alist) (cons tramp-autoload-file-name-regexp (quote tramp-autoload-file-name-handler))) (put (quote tramp-autoload-file-name-handler) (quote safe-magic) t))
 (tramp-register-autoload-file-name-handlers)

(defun tramp-unload-file-name-handlers nil "\
Unload Tramp file name handlers from `file-name-handler-alist'." (dolist (fnh file-name-handler-alist) (when (and (symbolp (cdr fnh)) (string-prefix-p "tramp-" (symbol-name (cdr fnh)))) (setq file-name-handler-alist (delq fnh file-name-handler-alist)))))

(defvar tramp-completion-mode nil "\
If non-nil, external packages signal that they are in file name completion.")

(defun tramp-unload-tramp nil "\
Discard Tramp from loading remote files." (interactive) (ignore-errors (unload-feature (quote tramp) (quote force))))

;;;***

;;;### (autoloads nil "tramp-archive" "tramp-archive.el" (24324 35929
;;;;;;  0 0))
;;; Generated autoloads from tramp-archive.el

(defvar tramp-archive-enabled (featurep 'dbusbind) "\
Non-nil when file archive support is available.")

(defconst tramp-archive-suffixes '("7z" "apk" "ar" "cab" "CAB" "cpio" "deb" "depot" "exe" "iso" "jar" "lzh" "LZH" "msu" "MSU" "mtree" "odb" "odf" "odg" "odp" "ods" "odt" "pax" "rar" "rpm" "shar" "tar" "tbz" "tgz" "tlz" "txz" "tzst" "warc" "xar" "xpi" "xps" "zip" "ZIP") "\
List of suffixes which indicate a file archive.
It must be supported by libarchive(3).")

(defconst tramp-archive-compression-suffixes '("bz2" "gz" "lrz" "lz" "lz4" "lzma" "lzo" "uu" "xz" "Z" "zst") "\
List of suffixes which indicate a compressed file.
It must be supported by libarchive(3).")

(defmacro tramp-archive-autoload-file-name-regexp nil "\
Regular expression matching archive file names." (quote (concat "\\`" "\\(" ".+" "\\." (regexp-opt tramp-archive-suffixes) "\\(?:" "\\." (regexp-opt tramp-archive-compression-suffixes) "\\)*" "\\)" "\\(" "/" ".*" "\\)" "\\'")))

(defalias 'tramp-archive-autoload-file-name-handler #'tramp-autoload-file-name-handler)

(defun tramp-register-archive-file-name-handler nil "\
Add archive file name handler to `file-name-handler-alist'." (when tramp-archive-enabled (add-to-list (quote file-name-handler-alist) (cons (tramp-archive-autoload-file-name-regexp) (function tramp-archive-autoload-file-name-handler))) (put (quote tramp-archive-autoload-file-name-handler) (quote safe-magic) t)))

(add-hook 'after-init-hook #'tramp-register-archive-file-name-handler)

(add-hook 'tramp-archive-unload-hook (lambda nil (remove-hook 'after-init-hook #'tramp-register-archive-file-name-handler)))

;;;***

;;;### (autoloads nil nil ("tramp-adb.el" "tramp-cache.el" "tramp-cmds.el"
;;;;;;  "tramp-compat.el" "tramp-ftp.el" "tramp-gvfs.el" "tramp-integration.el"
;;;;;;  "tramp-loaddefs.el" "tramp-pkg.el" "tramp-rclone.el" "tramp-sh.el"
;;;;;;  "tramp-smb.el" "tramp-sudoedit.el" "tramp-uu.el" "trampver.el")
;;;;;;  (24324 35930 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; tramp-autoloads.el ends here
