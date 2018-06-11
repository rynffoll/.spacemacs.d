(defconst rynffoll-common-packages '(evil
                                     evil-surround
                                     ivy
                                     dired
                                     ibuffer
                                     treemacs
                                     winum
                                     undo-tree
                                     reverse-im
                                     google-translate))

(defun rynffoll-common/post-init-evil ()
  ;; hack for working eval-last-sexp in normal state
  (setq evil-move-beyond-eol t
        evil-move-cursor-back t)
  ;; C-[ in russian layout
  (define-key evil-normal-state-map (kbd "C-х") 'evil-force-normal-state)
  (define-key evil-insert-state-map (kbd "C-х") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-х") 'evil-exit-visual-state))

(defun rynffoll-common/post-init-evil-surround ()
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region))

(defun rynffoll-common/post-init-ivy ()
  (setq ivy-format-function 'ivy-format-function-line
        ivy-virtual-abbreviate 'full
        ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format ""
        ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

(defun rynffoll-common/post-init-dired ()
  (setq dired-auto-revert-buffer t)
  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(defun rynffoll-common/post-init-ibuffer ()
  (with-eval-after-load 'ibuffer
    (setq ibuffer-show-empty-filter-groups nil)
    (add-hook 'ibuffer-mode-hook #'ibuffer-auto-mode)))

(defun rynffoll-common/post-init-treemacs ()
  (setq treemacs-no-png-images nil))

(defun rynffoll-common/post-init-winum ()
  (setq winum-scope 'frame-local))

(defun rynffoll-common/post-init-undo-tree ()
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist `(("." . ,(concat spacemacs-cache-directory "undo"))))
  (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
    (make-directory (concat spacemacs-cache-directory "undo"))))

(defun rynffoll-common/init-reverse-im ()
  (use-package reverse-im
    :config
    (reverse-im-activate "russian-computer")))

(defun rynffoll-common/post-init-google-translate ()
  (setq google-translate-default-target-language "ru"))
