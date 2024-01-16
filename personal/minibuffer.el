(use-package vertico ; 竖式展开小缓冲区
  :custom (verticle-cycle t)
  :config (vertico-mode))

(use-package marginalia ; 更多信息
  :config (marginalia-mode))

;; (use-package orderless ; 乱序补全
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-defaults nil)
;;   (completion-category-overrides '((file (styles partial-completion)))))
