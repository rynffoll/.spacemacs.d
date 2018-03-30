(defconst rynffoll-org-packages '(org
                                  persp-mode))

(defun rynffoll-org/post-init-org ()
  (require 'org-expiry)
  (org-expiry-insinuate)

  (setq org-bullets-bullet-list '("●")
        org-ellipsis "…"
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
        org-default-index-file (concat org-directory "/index.org")
        org-default-todo-file (concat org-directory "/todo.org")
        org-default-notes-file (concat org-directory "/notes.org")
        org-agenda-files `(,org-default-todo-file ,org-default-index-file)
        org-archive-location (concat org-directory "/old/archive.org" "::* From %s")))

(defun rynffoll-org/post-init-persp-mode ()
  (spacemacs|define-custom-layout "@Org"
    :binding "o"
    :body
    (progn
      (find-file org-default-inbox-file)
      (split-window-right-and-focus)
      (find-file org-default-todo-file))))
