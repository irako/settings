;
; Global
;
(setq initial-major-mode 'fundamental-mode)
(setq default-major-mode 'fundamental-mode)
(setq-default tab-width 4 indent-tabs-mode nil)

(setq default-major-mode 'text-mode)
(setq auto-save-list-file-prefix nil)

;(require 'un-define)

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;
;
;
  (global-set-key "\eh" 'help)
  (global-set-key "\C-h" 'backward-delete-char)
  (define-key isearch-mode-map "\C-h" 'isearch-delete-char)

  (define-key global-map "\C-c;" 'comment-region)
  (define-key global-map "\C-c:" 'uncomment-region)
  (define-key global-map "\C-z" 'undo)

  (column-number-mode t)
  (line-number-mode t)

  (setq require-final-newline t)

  ;(setq-default fill-column 69)
  ;(setq text-mode-hook 'turn-on-auto-fill)

  ;(display-time)

;
; Japanese
;
;(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

; lua
(add-to-list 'load-path "~/.emacs.d/lua-mode/")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; タブ、空白、改行に色を付ける
;(defface my-face-r-1 '((t (:background "gray15"))) nil)                                                                                                       

(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
