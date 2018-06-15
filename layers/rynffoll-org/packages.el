(defconst rynffoll-org-packages '(org
                                  (org-expiry :location built-in)
                                  org-bullets
                                  org-pomodoro
                                  org-download
                                  org-fancy-priorities
                                  persp-mode))

(defun rynffoll-org/post-init-org ()
  (setq org-ellipsis "…"
        org-hide-emphasis-markers nil ; hide markup elements, e.g. * *, / /, _ _
        org-list-allow-alphabetical t
        org-log-into-drawer t
        org-startup-indented t
        org-pretty-entities t
        org-edit-src-content-indentation 0
        org-src-window-setup 'current-window
        org-tags-column 0
        org-agenda-tags-column 0
        org-directory "~/Dropbox/Org"
        org-default-inbox-file (concat org-directory "/inbox.org")
        org-default-todo-file (concat org-directory "/todo.org")
        org-default-notes-file (concat org-directory "/notes.org")
        org-agenda-files `(,org-default-todo-file ,org-default-inbox-file)
        org-archive-location (concat org-directory "/old/archive.org" "::* From %s")))

(defun rynffoll-org/post-init-org-expiry ()
  (with-eval-after-load 'org-mode
    (org-expiry-insinuate)))

(defun rynffoll-org/post-init-org-bullets ()
  (setq org-bullets-bullet-list '("●")))

(defun rynffoll-org/post-init-org-pomodoro ()
  (setq org-pomodoro-format "● %s"))

(defun rynffoll-org/post-init-org-download ()
  (when (spacemacs/system-is-mac)
    (setq org-download-screenshot-method "screencapture")))

(defun rynffoll-org/init-org-fancy-priorities ()
  (use-package org-fancy-priorities
    :defer t
    :init
    (setq org-fancy-priorities-list '("‼" "↑" "↓"))
    :hook
    (org-mode . org-fancy-priorities-mode)))

(defun rynffoll-org/post-init-persp-mode ()
  (spacemacs|define-custom-layout "@Org"
    :binding "o"
    :body
    (progn
      (find-file org-default-inbox-file)
      (split-window-right-and-focus)
      (find-file org-default-todo-file))))
