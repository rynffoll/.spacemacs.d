(defconst rynffoll-org-packages
  '(
    org
    ))

(defun rynffoll-org/post-init-org ()
  (setq org-bullets-bullet-list '("●")
        org-ellipsis "…"
        org-hide-emphasis-markers nil ; hide markup elements, e.g. * *, / /, _ _
        org-list-allow-alphabetical t
        org-log-into-drawer t
        org-tags-column 0
        org-startup-indented t

        org-edit-src-content-indentation 0
        org-src-window-setup 'current-window

        org-clock-persist t
        org-clock-persist-query-resume nil
        org-expiry-inactive-timestamps t

        org-enforce-todo-dependencies t
        org-enforce-todo-checkbox-dependencies t

        org-agenda-show-log t
        org-agenda-tags-column 0
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled

        org-todo-keywords '("TODO(t)"
                            "STARTED(s!)"
                            "WAITING(w@/!)"
                            "|" "CANCELED(c@)" "DONE(d)")
        org-todo-keyword-faces '(("STARTED" . (:foreground "#B4C342" :weight bold))
                                 ("WAITING". (:foreground "#9EA0E5":weight bold))
                                 ("CANCELED" . (:foreground "#FF6E64" :weight bold)))
        org-tag-alist '(("work"     . ?w)
                        ("env"      . ?e)
                        ("personal" . ?p)
                        ("dev"      . ?d)
                        ("comp"     . ?c)
                        ("books"    . ?b)
                        ("home"     . ?h)
                        ("finance"  . ?f)
                        ("link"     . ?L)
                        ("org"      . ?o)
                        ("emacs"    . ?E))

        org-default-notes-file (concat rynffoll-org/org-directory "/notes.org")
        org-default-todo-file (concat rynffoll-org/org-directory "/todo.org")
        org-default-inbox-file (concat rynffoll-org/org-directory "/inbox.org")
        org-agenda-files `(,org-default-todo-file ,org-default-inbox-file)
        org-archive-location (concat rynffoll-org/org-directory "/archive.org" "::* From %s")

        org-capture-templates `(("t" "Task" entry
                                 (file,org-default-todo-file)
                                 ,(concat "* TODO %?\n"
                                          ":PROPERTIES:\n"
                                          ":CREATED: %U\n"
                                          ":END:\n"))
                                ("n" "Note" entry
                                 (file ,org-default-notes-file)
                                 ,(concat "* %?\n"
                                          ":PROPERTIES:\n"
                                          ":CREATED: %U\n"
                                          ":END:\n"))
                                ("p" "Protocol" entry
                                 (file ,org-default-inbox-file)
                                 ,(concat "* %^{Title} :link:\n"
                                          ":PROPERTIES:\n"
                                          ":CREATED: %U\n"
                                          ":SOURCE: %c\n"
                                          ":END:\n"
                                          "#+BEGIN_QUOTE\n"
                                          "%i\n"
                                          "#+END_QUOTE\n"))
                                ("L" "Protocol Link" entry
                                 (file ,org-default-inbox-file)
                                 ,(concat "* [[%:link][%:description]] :link:\n"
                                          ":PROPERTIES:\n"
                                          ":CREATED: %U\n"
                                          ":END:\n"))))
  (org-clock-persistence-insinuate) ;; resume org-clock after restaring

  (require 'org-expiry)
  (org-expiry-insinuate)

  (require 'org-protocol)

  ;; fontify done checkbox
  (font-lock-add-keywords
   'org-mode
   `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)" 1 'org-headline-done prepend))
   'append)

  ;; customize theme
  (custom-set-faces
   `(org-tag ((t (:inherit shadow))))))
