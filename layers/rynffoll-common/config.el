;; better defaults
(setq-default frame-resize-pixelwise t
              vc-follow-symlinks t
              inhibit-compacting-font-caches t
              make-backup-files nil
              create-lockfiles nil
              backward-delete-char-untabify-method 'hungry
              calendar-week-start-day 1
              enable-local-variables :all
              enable-local-eval t)

;; input method
(setq default-input-method "russian-computer")

;; WSL tweaks
(when (file-directory-p "/mnt/c/Windows/System32/cmd.exe")
  ;; https://adam.kruszewski.name/2017/09/emacs-in-wsl-and-opening-links/
  (let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
        (cmd-args '("/c" "start")))
    (when (file-exists-p cmd-exe)
      (setq browse-url-generic-program  cmd-exe
            browse-url-generic-args     cmd-args
            browse-url-browser-function 'browse-url-generic))))
