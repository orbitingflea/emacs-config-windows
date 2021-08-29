(setq blogger-post-filename "F:\\blog\\quick_publisher\\post.md")

;; --- Original Setting ---
;; (setq scratch-message
;; ";; This buffer is for text that is not saved, and for Lisp evaluation.
;; ;; To create a file, visit it with C-x C-f and enter text in its buffer.")

;; --- New Setting ---
(setq scratch-message
";; 心情不错！写点什么？")
(setq initial-scratch-message (concat scratch-message "\n\n"))

(defun remove-default-prefix (str)
  (let ((n (length str)) (m (length scratch-message)))
    (concat
     "\n"
     (if (and (>= n m) (string-equal (substring str 0 m) scratch-message))
         (substring str m n) str)
     "\n"
     )))


(defun blogger-publish ()
  (start-process-shell-command
   "" nil "python3 F:\\blog\\quick_publisher\\main.py"))


(defun call-publisher ()
  (interactive)
  (blogger-publish))


(defun blogger-kill-buffer ()
  (let ((buf-this (get-file-buffer blogger-post-filename)))
    (if buf-this (kill-buffer buf-this))))


(defun blogger-query-publish ()
  (find-file blogger-post-filename)
  (if (yes-or-no-p "Publish this file? ")
      (progn (blogger-publish)
             (blogger-kill-buffer)
             (message "Called quick publisher."))
    (message "Cancelled.")))


(defun blogger-publish-region ()
  (interactive)
  (if (let ((buf-target (get-file-buffer blogger-post-filename)))
        (eql (current-buffer) buf-target))
      (progn (blogger-publish)
             (blogger-kill-buffer)
             (message "Called quick publisher."))
    (let (( blog-text (if (use-region-p)
                          (buffer-substring (region-beginning) (region-end))
                        (buffer-string)) ))
      (blogger-kill-buffer)
      (write-region (remove-default-prefix blog-text)
                    nil blogger-post-filename 'append)
      (blogger-query-publish)
    )))
(defalias 'publish-blog 'blogger-publish-region)


(defun open-post ()
  (interactive)
  (blogger-kill-buffer)
  (find-file blogger-post-filename))
