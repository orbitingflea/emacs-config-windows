;;; -------- 设置字体 --------
;; 仅在 GUI mode 下设置字体。

(if (display-graphic-p)  
    (progn


;; Setting English Font
(set-face-attribute
 'default nil :font "Consolas 13")

;; Chinese Font
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 18)))

;; Set Math Font
(dolist (charset '(symbol mathematical))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Cambria Math" :size 18)))


))
