;; (setq solarized-dark-bg "#002b36"
;;       solarized-light-bg "#fdf6e3"
;;       solarized-dark-bg-inactive "#073642"
;;       solarized-light-bg-inactive "#eee8d5")

;; (setq theming-modifications
;;       `((solarized-dark
;;          (mode-line :inherit mode-line
;;                     :background ,solarized-dark-bg ;:height 0.95
;;                     :box nil :underline nil :overline nil)
;;          (mode-line-inactive :inherit powerline-inactive1
;;                              :background ,solarized-dark-bg-inactive ;:height 0.95
;;                              :box nil :underline nil :overline nil)
;;          (spaceline-highlight-face :inherit mode-line :background ,solarized-dark-bg)
;;          (powerline-active1 :inherit mode-line :background ,solarized-dark-bg)
;;          (powerline-active2 :inherit mode-line :background ,solarized-dark-bg)

;;          (powerline-inactive1 :background ,solarized-dark-bg-inactive)
;;          (powerline-inactive2 :inherit powerline-inactive1
;;                               :background ,solarized-dark-bg-inactive)
;;          (org-tag :inherit shadow))

;;         (solarized-light
;;          (mode-line :inherit mode-line
;;                     :background ,solarized-light-bg ;:height 0.95
;;                     :box nil :underline nil :overline nil)
;;          (mode-line-inactive :inherit mode-line
;;                              :background ,solarized-light-bg-inactive ;:height 0.95
;;                              :box nil :underline nil :overline nil)
;;          (spaceline-highlight-face :inherit mode-line :background ,solarized-light-bg)
;;          (powerline-active1 :inherit mode-line :background ,solarized-light-bg)
;;          (powerline-active2 :inherit mode-line :background ,solarized-light-bg)

;;          (powerline-inactive1 :background ,solarized-light-bg-inactive)
;;          (powerline-inactive2 :inherit powerline-inactive1
;;                               :background ,solarized-light-bg-inactive)
;;          (org-tag :inherit shadow))))


(setq rynffoll-ui/unboxed-modeline-face '((mode-line :inherit mode-line :box nil)
                                          (mode-line-inactive :inherit mode-line-inactive :box nil))
      rynffoll-ui/shadow-org-tag-face '((org-tag :inherit shadow))
      theming-modifications `((spacemacs-light
                               ,@rynffoll-ui/unboxed-modeline-face
                               ,@rynffoll-ui/shadow-org-tag-face)

                              (spacemacs-dark
                               ,@rynffoll-ui/unboxed-modeline-face
                               ,@rynffoll-ui/shadow-org-tag-face)

                              (solarized-light
                               ,@rynffoll-ui/unboxed-modeline-face
                               ,@rynffoll-ui/shadow-org-tag-face)

                              (solarized-dark
                               ,@rynffoll-ui/unboxed-modeline-face
                               ,@rynffoll-ui/shadow-org-tag-face)))

(setf (cdr (assq 'continuation fringe-indicator-alist))
      ;; '(nil nil) ;; no continuation indicators
      '(nil right-curly-arrow) ;; right indicator only
      ;; '(left-curly-arrow nil) ;; left indicator only
      ;; '(left-curly-arrow right-curly-arrow) ;; default
      )

;; Local Variables:
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
