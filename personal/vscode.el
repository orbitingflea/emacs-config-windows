(defun open-in-vscode ()
  (interactive)
  (shell-command (concat "code-insiders " (buffer-file-name))))

(global-set-key [f8] 'open-in-vscode)
