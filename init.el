(defmacro is-windows (x y)
  (if (spacemacs/system-is-mswindows) x y))

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     vimscript
     asciidoc
     (ansible :variables
              ansible-auto-encrypt-descrypt t)
     csv
     autohotkey
     nginx
     ivy
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     (org :variables
          org-want-todo-bindings t
          org-enable-github-support t
          org-enable-bootstrap-support t
          org-enable-reveal-js-support t)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)
     git
     (github :packages (not magithub))
     (version-control :variables
                      version-control-diff-tool 'diff-hl)
     (shell :variables
            shell-default-shell 'eshell)
     docker
     systemd
     restclient
     ranger
     prodigy
     emacs-lisp
     (java :variables
           java-backend 'meghanada)
     groovy
     (clojure :variables
              clojure-enable-fancify-symbols t)
     javascript
     typescript
     shell-scripts
     windows-scripts
     sql
     html
     yaml
     markdown
     react
     colors
     erc
     evil-cleverparens
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
     evil-commentary
     imenu-list
     command-log

     ;; local
     (rynffoll :variables
               rynffoll/projects-directory "~/Projects"
               rynffoll/org-directory (is-windows "~/OneDrive/Org" "~/Dropbox/Org"))
     (notifications :variables
                    notifications-backend (is-windows 'toaster 'libnotify))
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   dotspacemacs-themes '(solarized-light
                         solarized-dark)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font `("Fira Mono Medium"
                               :size ,(is-windows 15 14)
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text t
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names t
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))

(defun dotspacemacs/user-config ()
  (load custom-file 'no-error 'no-message))
