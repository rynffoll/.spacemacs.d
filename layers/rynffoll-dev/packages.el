(setq rynffoll-dev-packages '(magit
                              ssh-agency
                              js2-mode
                              (js-mode :location built-in)
                              (css-mode :location built-in)
                              web-mode
                              json-mode
                              log4j-mode
                              (magit-todos :location (recipe
                                                      :fetcher github
                                                      :repo "alphapapa/magit-todos"))
                              persp-mode
                              gitignore-templates))

(defun rynffoll-dev/post-init-magit ()
  (setq magit-repository-directories `((,user-emacs-directory . 0)
                                       (,dotspacemacs-directory . 0)
                                       (,projects-directory . 1))
        magit-display-buffer-function #'magit-display-buffer-fullframe-status-topleft-v1))

(defun rynffoll-dev/init-ssh-agency ()
  (use-package ssh-agency :defer t))

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
  (use-package log4j-mode :defer t))

(defun rynffoll-dev/init-magit-todos ()
  (use-package magit-todos
    :defer t
    :init
    (spacemacs|add-transient-hook magit-mode-hook
      (lambda ()
        (require 'magit-todos)
        (magit-todos-mode t)))))

(defun rynffoll-dev/post-init-persp-mode ()
  (spacemacs|define-custom-layout "@Projects"
    :binding "p"
    :body (find-file projects-directory)))

(defun rynffoll-dev/init-gitignore-templates ()
  (use-package gitignore-templates
    :defer t
    :init
    (spacemacs/set-leader-keys-for-major-mode 'gitignore-mode
      "i" 'gitignore-templates-insert)
    (spacemacs/set-leader-keys
      "gfi" 'gitignore-templates-new-file)))
