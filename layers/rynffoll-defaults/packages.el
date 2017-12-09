(defconst rynffoll-defaults-packages
  '(
    evil
    evil-cleverparens
    evil-surround
    ivy
    ivy-rich
    dired
    ranger
    treemacs
    winum
    undo-tree
    reverse-im
    yasnippet-snippets
    (fb2-mode :location (recipe
                         :fetcher github
                         :repo "spline1986/fb2-mode"))
    ))

(defun rynffoll-defaults/post-init-evil ()
  (setq evil-escape-unordered-key-sequence t))

(defun rynffoll-defaults/post-init-evil-cleverparens ()
  (spacemacs/toggle-evil-cleverparens-on)
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-hook 'lisp-mode-hook #'evil-cleverparens-mode)
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode))

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
        ranger-deer-show-details nil))

(defun rynffoll-defaults/post-init-treemacs ()
  (with-eval-after-load 'treemacs ;; for applying treemacs-{indentation,is-never-other-window}
    (setq treemacs-winum-number 0
          treemacs-no-png-images t
          treemacs-indentation 1
          treemacs-indentation-string (propertize "| " 'face 'font-lock-comment-face)
          treemacs-is-never-other-window t
          treemacs-header-function #'(lambda (current-root)
                                       (format "%s" (file-name-nondirectory current-root))))))

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

(defun rynffoll-defaults/init-yasnippet-snippets ()
  (use-package yasnippet-snippets
    :after yasnippet))

(defun rynffoll-defaults/init-fb2-mode ()
  (use-package fb2-mode))
