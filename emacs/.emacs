(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Code New Roman" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;; Inhibit splash/startup screens
(setq-default inhibit-splash-screen t)
(setq-default inhibit-startup-message t)

;; Smooth scrolling without jumping screens
(setq-default scroll-step 1)
(setq-default scroll-conservatively 10000)

;; Do not truncate lines by default
(setq-default truncate-lines t)

;; Line numbers
;; (global-linum-mode t)

;; Whitespace Mode
;; (global-whitespace-mode t)

;; Use 2 spaces as tab
(defun setup-indentation ()
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
  ;;(setq indent-line-function 'insert-tab))
(add-hook 'text-mode-hook 'setup-indentation)
(add-hook 'haskell-mode-hook 'setup-indentation)
(add-hook 'fsharp-mode-hook 'setup-indentation)
(add-hook 'csharp-mode-hook 'setup-indentation)
(add-hook 'markdown-mode-hook 'setup-indentation)
(add-hook 'js-mode-hook 'setup-indentation)

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Install Git Gutter
(unless (package-installed-p 'magit) (package-install 'magit))

;; Install Intero
(unless (package-installed-p 'intero) (package-install 'intero))
(add-hook 'haskell-mode-hook 'intero-mode)

;; Install Markdown Mode
(unless (package-installed-p 'markdown-mode) (package-install 'markdown-mode))

;; Install C# Mode
(unless (package-installed-p 'csharp-mode) (package-install 'csharp-mode))

;; Install F# Mode
(unless (package-installed-p 'fsharp-mode) (package-install 'fsharp-mode))

;; Install PureScript Mode
(unless (package-installed-p 'purescript-mode) (package-install 'purescript-mode))

;; Install Themes
(when (display-graphic-p)
  (unless (package-installed-p 'monokai-theme) (package-install 'monokai-theme))
  (unless (package-installed-p 'meacupla-theme) (package-install 'meacupla-theme))
  (load-theme 'monokai t)
)

;; Key bindings
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;; Set Frame width/height
(when (display-graphic-p)
  (defun arrange-frame (w h x y)
    "Set the width, height, and x/y position of the current frame"
    (let ((frame (selected-frame)))
      (delete-other-windows)
      (set-frame-position frame x y)
      (set-frame-size frame w h)))
  (arrange-frame 120 40 10 10)
)
