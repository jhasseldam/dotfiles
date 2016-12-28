(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(package-initialize)

(unless (package-installed-p 'linum-relative)
  (package-install 'linum-relative))

(unless (package-installed-p 'nix-mode)
  (package-install 'nix-mode))

(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))

(unless (package-installed-p 'powerline)
  (package-install 'powerline))

(unless (package-installed-p 'ample-theme)
  (package-install 'ample-theme))

(unless (package-installed-p 'airline-themes)
  (package-install 'airline-themes))

(unless (package-installed-p 'intero)
  (package-install 'intero))

;; Settings
(require 'linum-relative)
(global-linum-mode t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)
(require 'nix-mode)
;; Start in fullscreen mode
(run-at-time 1 nil (lambda () (set-frame-parameter nil 'fullscreen 'fullboth)))
(require 'multiple-cursors)
(require 'powerline)
(powerline-default-theme)
(require 'airline-themes)
(load-theme 'ample t)
(load-theme 'airline-papercolor t)
(add-hook 'haskell-mode-hook 'intero-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono Dotted for Powerline" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
