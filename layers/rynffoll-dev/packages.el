(setq rynffoll-dev-packages '(magit
                              ssh-agency
                              js2-mode
                              (js-mode :location built-in)
                              (css-mode :location built-in)
                              web-mode
                              json-mode
                              log4j-mode
                              magit-org-todos
                              persp-mode
                              gitignore-templates))

(defun rynffoll-dev/post-init-magit ()
  (setq magit-repository-directories `(,user-emacs-directory
                                       ,dotspacemacs-directory
                                       ,projects-directory)
        magit-display-buffer-function #'magit-display-buffer-fullframe-status-topleft-v1))

(defun rynffoll-dev/init-ssh-agency ()
  (use-package ssh-agency))

(defun rynffoll-dev/post-init-js2-mode ()
  (setq-default js2-basic-offset standard-indent))

(defun rynffoll-dev/post-init-js-mode ()
  (setq js-indent-level standard-indent))

(defun rynffoll-dev/post-init-json-mode ()
  (setq json-reformat:indent-width standard-indent)
  (add-hook 'json-mode-hook #'(lambda ()
                                (setq js-indent-level standard-indent))))

(defun rynffoll-dev/post-init-css-mode ()
  (setq css-indent-offset 2))

(defun rynffoll-dev/post-init-web-mode ()
  (add-to-list 'magic-mode-alist '("^import React" . react-mode)))

(defun rynffoll-dev/init-log4j-mode ()
  (use-package log4j-mode))

(defun rynffoll-dev/init-magit-org-todos ()
  (use-package magit-org-todos
    :config
    (magit-org-todos-autoinsert)))

(defun rynffoll-dev/post-init-persp-mode ()
  (spacemacs|define-custom-layout "@Projects"
    :binding "p"
    :body
    (progn
      (find-file projects-directory))))

(defun rynffoll-dev/init-gitignore-templates ()
  (use-package gitignore-templates))
