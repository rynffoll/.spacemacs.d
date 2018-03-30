(defconst rynffoll-tools-packages '(ranger))

(defun rynffoll-tools/post-init-ranger ()
  (setq ranger-show-preview t
        ranger-width-preview 0.55
        ranger-max-preview-size 10
        ranger-width-parents 0.15
        ranger-deer-show-details nil))
