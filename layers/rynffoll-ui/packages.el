(defconst rynffoll-ui-packages
  '(
    spaceline
    solarized-theme
    ))

(defun rynffoll-ui/post-init-spaceline ()
  (setq spaceline-minor-modes-p nil
        spaceline-hud-p nil
        spaceline-purpose-p nil
        spaceline-buffer-position-p nil
        spaceline-buffer-modified-p nil
        spaceline-buffer-encoding-abbrev-p nil
        spaceline-buffer-size-p nil
        spaceline-input-method-p t
        spaceline-org-clock-p t
        spaceline-org-pomodoro-p t))

(defun rynffoll-ui/init-solarized-theme ()
  (setq solarized-height-minus-1 1.0
        solarized-height-plus-1 1.0
        solarized-height-plus-2 1.0
        solarized-height-plus-3 1.0
        solarized-height-plus-4 1.0
        solarized-use-variable-pitch nil
        solarized-scale-org-headlines nil))
