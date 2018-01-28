(setq rynffoll-dev-packages
      '(
        magit
        ssh-agency
        js2-mode
        (js-mode :location built-in)
        (css-mode :location built-in)
        log4j-mode
        web-mode
        ))

(defun rynffoll-dev/post-init-magit ()
  (setq magit-repository-directories `(,rynffoll/projects-directory)
        magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(defun rynffoll-dev/init-ssh-agency ()
  (use-package ssh-agency))

(defun rynffoll-dev/post-init-js2-mode ()
  (setq js2-basic-offset 2))

(defun rynffoll-dev/post-init-js-mode ()
  (setq js-indent-level 2))

(defun rynffoll-dev/post-init-css-mode ()
  (setq css-indent-offset 2))

(defun rynffoll-dev/init-log4j-mode ()
  (use-package log4j-mode))

(defun rynffoll-dev/post-init-web-mode ()
  (add-to-list 'magic-mode-alist '("^import React" . react-mode)))
