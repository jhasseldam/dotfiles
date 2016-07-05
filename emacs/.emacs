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
 '(default ((t (:family "Code New Roman" :foundry "CNR " :slant normal :weight normal :height 143 :width normal)))))

;; Inhibit splash/startup screens
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Smooth scrolling without jumping screens
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; Line numbers
;; (global-linum-mode t)

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Install Git Gutter
(unless (package-installed-p 'git-gutter) (package-install 'git-gutter))

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
  (load-theme 'meacupla t)
)

;; Key bindings
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-regiod)

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
