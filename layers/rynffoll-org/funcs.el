(defadvice org-capture
    (after org-capture activate)
  "Advise capture to be the only window when used as a popup"
  (when (frame-parameter nil 'org-capture)
    (delete-other-windows)))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (when (frame-parameter nil 'org-capture))
  (delete-frame))
