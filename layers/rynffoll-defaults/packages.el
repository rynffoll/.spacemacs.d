(defconst rynffoll-defaults-packages
  '(
    evil-surround
    ivy
    dired
    ranger
    treemacs
    winum
    undo-tree
    reverse-im
    ))

(defun rynffoll-defaults/post-init-evil-surround ()
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region))

(defun rynffoll-defaults/post-init-ivy ()
  (setq ivy-format-function 'ivy-format-function-line
        ivy-virtual-abbreviate 'full
        ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format ""
        ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

(defun rynffoll-defaults/post-init-dired ()
  (setq dired-auto-revert-buffer t)
  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(defun rynffoll-defaults/post-init-ranger ()
  (setq ranger-show-preview t
        ranger-width-preview 0.55
        ranger-max-preview-size 10
        ranger-width-parents 0.15
        ranger-deer-show-details nil))

(defun rynffoll-defaults/post-init-treemacs ()
    (setq treemacs-no-png-images t))

(defun rynffoll-defaults/post-init-winum ()
  (setq winum-scope 'frame-local))

(defun rynffoll-defaults/post-init-undo-tree ()
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist `(("." . ,(concat spacemacs-cache-directory "undo"))))
  (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
    (make-directory (concat spacemacs-cache-directory "undo"))))

(defun rynffoll-defaults/init-reverse-im ()
  (use-package reverse-im
    :config
    (reverse-im-activate "russian-computer")))
