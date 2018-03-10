(defconst rynffoll-org-packages
  '(
    org
    ))

(defun rynffoll-org/post-init-org ()
  (require 'org-expiry)
  (org-expiry-insinuate)

  (setq org-bullets-bullet-list '("●")
        org-ellipsis "…"
        org-hide-emphasis-markers t ; hide markup elements, e.g. * *, / /, _ _
        org-list-allow-alphabetical t
        org-log-into-drawer t
        org-startup-indented t
        org-pretty-entities t
        org-edit-src-content-indentation 0
        org-src-window-setup 'current-window
        org-tags-column 0
        org-agenda-tags-column 0
        org-directory "~/Dropbox/Org"
        org-default-todo-file (concat org-directory "/todo.org")
        org-default-notes-file (concat org-directory "/notes.org")
        org-agenda-files `(,org-default-todo-file)
        org-archive-location (concat org-directory "/old/archive.org" "::* From %s")))
