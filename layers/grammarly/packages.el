;;; packages.el --- grammarly layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Ruslan Kamashev <rynffoll@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst grammarly-packages
  '((emacs-grammarly :location (recipe
                                :fetcher github
                                :repo "mmagnus/emacs-grammarly"))))

(defun grammarly/init-emacs-grammarly ()
  (use-package emacs-grammarly
    :init
    (spacemacs/declare-prefix "xG" "Grammarly")
    (spacemacs/set-leader-keys
      "xG" 'grammarly-save-region-and-run)))
