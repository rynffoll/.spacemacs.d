(configuration-layer/declare-layers
 '(git
   github
   (version-control :variables
                    version-control-diff-tool 'diff-hl
                    version-control-diff-side 'left
                    version-control-global-margin t)
   (auto-completion :variables
                    auto-completion-enable-help-tooltip t
                    auto-completion-enable-sort-by-usage t
                    auto-completion-enable-snippets-in-popup t)
   syntax-checking
   (shell :variables
          shell-default-shell 'eshell
          shell-enable-smart-eshell t)
   ;; parinfer
   (ansible :variables ansible-auto-encrypt-descrypt t)
   vimscript
   asciidoc
   csv
   autohotkey
   nginx
   systemd
   emacs-lisp
   (java :variables java-backend 'eclim)
   groovy
   kotlin
   scala
   (clojure :variables clojure-enable-fancify-symbols t)
   go
   javascript
   typescript
   python
   shell-scripts
   windows-scripts
   sql
   html
   yaml
   markdown
   react))
