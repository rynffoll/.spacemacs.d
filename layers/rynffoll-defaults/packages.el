(defconst rynffoll-defaults-packages
  '(
    evil
    ivy
    ivy-rich
    dired
    ranger
    neotree
    winum
    undo-tree
    ;; reverse-im
    yasnippet-snippets
    evil-goggles
    ))

(defun rynffoll-defaults/post-init-evil ()
  ;; (spacemacs/toggle-evil-cleverparens-on)
  ;; (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  )

(defun rynffoll-defaults/post-init-ivy ()
  (setq ivy-format-function 'ivy-format-function-line
        ivy-virtual-abbreviate 'full
        ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format ""
        ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

(defun rynffoll-defaults/init-ivy-rich ()
  (use-package ivy-rich
    :config
    (setq ivy-rich-switch-buffer-align-virtual-buffer t
          ivy-rich-abbreviate-paths t)
    (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)))

(defun rynffoll-defaults/post-init-dired ()
  (setq dired-auto-revert-buffer t)
  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(defun rynffoll-defaults/post-init-ranger ()
  (setq ranger-show-preview t
        ranger-width-preview 0.55
        ranger-max-preview-size 10
        ranger-width-parents 0.15
        ranger-deer-show-details nil
        ;; ranger-override-dired 'deer
        )
  ;; (ranger-override-dired-mode t)
  )

(defun rynffoll-defaults/post-init-neotree ()
  (setq neo-theme 'nerd))

(defun rynffoll-defaults/post-init-winum ()
  (setq winum-scope 'frame-local))

(defun rynffoll-defaults/post-init-undo-tree ()
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist `(("." . ,(concat spacemacs-cache-directory "undo"))))
  (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
    (make-directory (concat spacemacs-cache-directory "undo"))))

;; reverse-im
;; (defun rynffoll-defaults/init-reverse-im ()
;;   (use-package reverse-im
;;     :config
;;     (reverse-im-activate "russian-computer"))
;;   )

(defun rynffoll-defaults/init-yasnippet-snippets ()
  (use-package yasnippet-snippets
    :after yasnippet))

(defun rynffoll-defaults/init-evil-goggles ()
  (use-package evil-goggles
    :after magit
    :config
    (setq evil-goggles-duration 0.100
          evil-goggles-pulse t)
    (evil-goggles-mode)
    (evil-goggles-use-magit-faces)))
