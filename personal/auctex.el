(defun my/latex-hook ()
  ;; (turn-on-cdlatex)
  (turn-on-reftex)
  (prettify-symbols-mode t))

(use-package tex
  :ensure auctex
  :defer t
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t) ; 自动解析 tex 文件
  (TeX-PDF-mode t)
  (TeX-DVI-via-PDFTeX t)
  (reftex-plug-into-AUCTeX t)
  :config
  (add-hook 'LaTeX-mode-hook 'my/latex-hook)
  ;; (setq TeX-auto-save t)
  ;; (setq TeX-parse-self t)
  (setq LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %(file-line-error) %(extraopts) %S%(PDFout)")))
  ;; [disabled] preview-gs-command "C:/Program Files/gs/gs10.00.0/bin/gswin64c.exe"
  (setq-default TeX-engine 'xetex)
  ;; Custom PDF Viewer
  ;; Append to TeX-view-program-list
  (add-to-list 'TeX-view-program-list '("SumatraPaper" "python D:\\Program\\SumatraPaper\\SumatraPaper.py %o"))
  (setq TeX-view-program-selection '((output-pdf "SumatraPaper")))
  (setq prettify-symbols-unprettify-at-point nil)
  )

;; (use-package cdlatex
;;   :after tex ; 保证 cdlatex 在 auctex 之后加载
;;   :load-path "lisp/" ; 需要手动从网盘或 https://github.com/cdominik/cdlatex/blob/master/cdlatex.el 下载 cdlatex.el 文件, 并置于 ~/.emacs.d/lisp/ 文件夹下
;;   ;; 若使用 straight, 注释前一行, 并取消下一行注释:
;;   ;; :straight (:host github :repo "cdominik/cdlatex" )
;; )
