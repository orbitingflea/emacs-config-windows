(defun my/latex-hook ()
  ;; [disabled] ;; (turn-on-cdlatex)
  (turn-on-reftex)
  (prettify-symbols-mode t)
  (TeX-fold-mode 1))

(server-start)

(use-package tex
  :ensure auctex
  :defer t
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (reftex-plug-into-AUCTeX t)
  (TeX-PDF-mode t)
  (TeX-DVI-via-PDFTeX t)
  (preview-auto-cache-preamble nil)
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-method 'synctex)

  :config
  (add-hook 'LaTeX-mode-hook 'my/latex-hook)
  (setq LaTeX-command-style
        '(("" "%(PDF)%(latex) -shell-escape %(file-line-error) %(extraopts) %S%(PDFout)")))
  (setq-default TeX-engine 'default)
  (setq prettify-symbols-unprettify-at-point nil)

  ;; [----- Custom PDF Viewer -----]
  ;; Append to TeX-view-program-list
  (add-to-list 'TeX-view-program-list
               '("SumatraPaper" "python D:\\Program\\SumatraPaper\\SumatraPaper.py %o %b %n"))
  (setq TeX-view-program-selection '((output-pdf "SumatraPaper")))
  )

;; (use-package cdlatex
;;   :after tex ; 保证 cdlatex 在 auctex 之后加载
;;   :load-path "lisp/" ; 需要手动从网盘或 https://github.com/cdominik/cdlatex/blob/master/cdlatex.el 下载 cdlatex.el 文件, 并置于 ~/.emacs.d/lisp/ 文件夹下
;;   ;; 若使用 straight, 注释前一行, 并取消下一行注释:
;;   ;; :straight (:host github :repo "cdominik/cdlatex" )
;; )
