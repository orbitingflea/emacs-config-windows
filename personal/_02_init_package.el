;; -*- lexical-binding: t; -*-
;; 静态作用域声明必须放在首行
;; 把 Emacs 自动添加的代码放到 custom.el 中
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;;========================================
;; 使用 package.el 设置 Emacs 插件管理
;;========================================

(require 'package) ; 加载 package.el
(setq package-check-signature nil) ; 如果检查签名有问题可以加入这一行
;; 添加仓库位置
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; 国内用户也可以使用清华的镜像网站. 用下面的代码代替上面两行
;; (setq package-archives
;;       '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
;;         ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
;;         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 刷新插件列表
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; 自动安装 use-package. 在Emacs 29中已内置故可省略
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; 自动安装所有使用 use-package 声明的插件
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;========================================
;; Emacs 插件管理设置完毕
;;========================================
