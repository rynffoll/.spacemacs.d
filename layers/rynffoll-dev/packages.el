(setq rynffoll-dev-packages
      '(
        projectile
        magit
        ssh-agency
        js2-mode
        (js-mode :location built-in)
        (css-mode :location built-in)
        ))

(defun rynffoll-dev/post-init-projectile ()
  (setq projectile-switch-project-action 'projectile-dired))

(defun rynffoll-dev/post-init-magit ()
  (setq magit-repository-directories `(,rynffoll-dev/projects-directory)
        ;; magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1
        ))

(defun rynffoll-dev/init-ssh-agency ()
  (use-package ssh-agency))

(defun rynffoll-dev/post-init-js2-mode ()
  (setq js2-basic-offset 2))

(defun rynffoll-dev/post-init-js-mode ()
  (setq js-indent-level 2))

(defun rynffoll-dev/post-init-css-mode ()
  (setq css-indent-offset 2))
