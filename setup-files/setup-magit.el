;; Time-stamp: <2014-10-15 09:31:43 kmodi>

;; magit
;; Source: https://github.com/magit/magit

(req-package magit
  :commands (magit-status)
  :requires (key-chord)
  :init
  (progn
    (bind-keys
     :map modi-mode-map
     ("<f11>"   . magit-status)
     ("<S-f11>" . magit-push)
     ("<M-f11>" . magit-pull))
    (key-chord-define-global "-[" 'magit-status)) ;; alternative for F11
  :config
  (progn
    (setq magit-completing-read-function 'magit-ido-completing-read)
    (setq magit-auto-revert-mode nil)
    (setq magit-repo-dirs '( "~/.emacs.d"))
    (setq magit-diff-options '("--ignore-space-change"))
    (magit-auto-revert-mode -1) ;; Disable magit auto revert
    ;; While in "*magit..*" buffer on doing Commit (`c c'), the
    ;; ".. COMMIT_EDITMSG" buffer opens and reuses the "*magit .." window.
    ;; This is not useful when you'd want to add details about what you are
    ;; committing while reviewing the diff in "*magit .." window. So ensure
    ;; that the ".. COMMIT_EDITMSG" buffer always pops up in a new window.
    ;; `display-buffer-alist' = '(CONDITION . (FUNCTION . ALIST))
    (add-to-list 'display-buffer-alist
                 '(".*COMMIT_EDITMSG". ((display-buffer-pop-up-window) .
                                        ((inhibit-same-window . t)))))))


(provide 'setup-magit)
