(configuration-layer/declare-layers
 '(
   git
   github
   (version-control :variables
                    version-control-diff-side 'left)
   lsp
   (auto-completion :variables
                    auto-completion-enable-help-tooltip nil
                    auto-completion-enable-sort-by-usage t
                    auto-completion-enable-snippets-in-popup t)
   (syntax-checking :variables
                    syntax-checking-enable-tooltips nil
                    syntax-checking-use-original-bitmaps t)
   (shell :variables
          shell-default-shell 'eshell
          shell-enable-smart-eshell t)
   ansible
   vimscript
   csv
   autohotkey
   nginx
   systemd
   emacs-lisp
   (java :variables java-backend 'lsp)
   groovy
   (clojure :variables clojure-enable-fancify-symbols t)
   ;; (go :variables go-backend 'lsp)
   json
   prettier
   (javascript :variables
               javascript-backend 'lsp
               javascript-fmt-tool 'prettier
               node-add-modules-path t)
   (typescript :variables
               typescript-backend 'lsp
               typescript-fmt-tool 'prettier)
   react
   ;; (python :variables python-backend 'lsp)
   shell-scripts
   windows-scripts
   (sql :variables sql-capitalize-keywords t)
   html
   yaml
   markdown
   ))
