(defun init-notification-app ()
  "Install OS-specific notification app"
  (interactive)
  (when (spacemacs/system-is-mswindows)
    (init-notification-app/toaster))
  (when (spacemacs/system-is-linux)
    (when (not (executable-find "notify-send"))
      (message "Please, install notify-send..."))))

(defun init-notification-app/toaster ()
  "Install notifications app (toaster) for Windows"
  (magit-clone "https://github.com/rynffoll/toaster"
               (concat user-emacs-directory "bin/toaster")))

(defun appt-disp-function-alert (min-to-app new-time appt-msg)
  (alert appt-msg
         :title (format "Appointment in %s minutes" min-to-app)))
