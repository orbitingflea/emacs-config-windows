(load-theme 'tango-dark)
(column-number-mode 1)

(setq make-backup-files nil
      inhibit-startup-screen t)

(global-set-key [f5] 'compile)
(global-set-key [f6] 'shell)

(setq-default default-tab-width 4
              tab-width 4)

;; now we do not truncate lines by default, so no need to write this.
;; (defun hook-do-not-truncate-lines ()
;;   (setq truncate-lines nil))
;; (add-hook 'org-mode-hook 'hook-do-not-truncate-lines)
;; (add-hook 'text-mode-hook 'hook-do-not-truncate-lines)

(defun hook-truncate-lines ()
  (setq truncate-lines t))
(add-hook 'c-mode-common-hook 'hook-truncate-lines)
