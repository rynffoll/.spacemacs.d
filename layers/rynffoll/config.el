(defvar rynffoll/projects-directory "~/Projects"
  "Path to projects directory")

(defvar rynffoll/org-directory "~/Org"
  "Path to directory with org-files")

(setq-default rynffoll/projects-directory "~/Projects"
              rynffoll/org-directory (is-windows "~/OneDrive/Org" "~/Dropbox/Org"))
