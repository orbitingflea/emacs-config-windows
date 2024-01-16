(use-package which-key
  :custom (which-key-idle-delay 0.5) ; 延迟时间, 以秒为单位
  :config (which-key-mode)) ; 启用 which-key 模式

(use-package keycast
  :config (keycast-header-line-mode 1)) ; 在标题显示

(use-package helpful
  :bind
  ;; 重新定向 C-h 开始的命令
  (([remap describe-function] . #'helpful-callable)
   ([remap describe-variable] . #'helpful-variable)
   ([remap describe-key] . #'helpful-key)
   ([remap describe-command] . #'helpful-command)
   ([remap describe-symbol] . #'helpful-symbol)
   ("C-h C-d" . #'helpful-at-point)
   ("C-h F" . #'helpful-function)))
