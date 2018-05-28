(configuration-layer/declare-layers
 '(git
   github
   (version-control :variables
                    version-control-diff-side 'left)
   lsp
   (auto-completion :variables
                    auto-completion-enable-help-tooltip t
                    auto-completion-enable-sort-by-usage t
                    auto-completion-enable-snippets-in-popup t)
   syntax-checking
   (shell :variables
          shell-default-shell 'eshell
          shell-enable-smart-eshell t)
   ansible
   vimscript
   csv
   autohotkey
   nginx
   systemd
   (emacs-lisp :variables emacs-lisp-hide-namespace-prefix t)
   (java :variables java-backend 'eclim)
   groovy
   (clojure :variables clojure-enable-fancify-symbols t)
   ;; go
   json
   ;; (javascript :variables javascript-backend 'lsp)
   ;; (typescript :variables typescript-backend 'lsp)
   ;; react
   ;; (python :variables python-backend 'lsp)
   shell-scripts
   windows-scripts
   (sql :variables sql-capitalize-keywords t)
   html
   yaml
   markdown))
