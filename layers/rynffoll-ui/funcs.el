(defun spaceline-custom-theme (&rest additional-segments)
  "My custom spaceline theme."
  (apply 'spaceline--theme
         '((((persp-name
              workspace-number
              window-number) :separator "|"))
           :fallback evil-state
           :face highlight-face
           :priority 100)
         '((buffer-modified buffer-size buffer-id remote-host)
           :priority 98)
         additional-segments))
