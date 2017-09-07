(defconst notifications-packages
  '(
    alert
    (appt :location built-in)
    ))

;; alert
(defun notifications/init-alert ()
  (use-package alert
    :config
    (setq alert-default-style notifications-backend
          alert-toaster-command (concat
                                 user-emacs-directory
                                 "bin/toaster/toast/bin/Release/toast.exe")
          alert-default-icon (concat
                              data-directory
                              "images/icons/hicolor/128x128/apps/emacs.png")
          alert-toaster-default-icon alert-default-icon)))

;; appt
(defun notifications/init-appt ()
  (use-package appt
    :config
    (setq appt-time-msg-list nil
          appt-display-interval '5
          appt-message-warning-time '15
          appt-display-mode-line nil
          appt-display-format 'window
          appt-disp-window-function 'appt-disp-function-alert)
    (appt-activate 1)

    (require 'org-agenda)
    (org-agenda-to-appt)
    (run-at-time "24:01" 3600 'org-agenda-to-appt)
    (add-hook 'org-finalize-agenda-hook #'org-agenda-to-appt)))
