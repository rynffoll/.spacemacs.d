(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "P" 'org-priority
  "sx" 'org-cut-subtree
  "sc" 'org-copy-subtree)

(spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
  "." 'spacemacs/org-agenda-transient-state/body)
