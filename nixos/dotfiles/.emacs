(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(package-initialize)

(unless (package-installed-p 'nix-mode)
  (package-install 'nix-mode))

(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))

(unless (package-installed-p 'powerline)
  (package-install 'powerline))

(unless (package-installed-p 'clues-theme)
  (package-install 'clues-theme))

(unless (package-installed-p 'airline-themes)
  (package-install 'airline-themes))

(unless (package-installed-p 'intero)
  (package-install 'intero))

(unless (package-installed-p 'helm)
  (package-install 'helm))

(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my-office-code-style ()
  (interactive)
  (message "Office code style!")
  ;; use tab instead of space
  (setq-local indent-tabs-mode t)
  ;; indent 4 spaces width
  (my-setup-indent 4))

(defun my-personal-code-style ()
  (interactive)
  (message "My personal code style!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2))

(defmacro when-gui (&rest body)
  "Works just like `progn' but will only evaluate expressions in VAR when Emacs is running in a terminal else just nil."
  `(when (display-graphic-p) ,@body))

;; Settings
(when-gui
  (global-linum-mode t))
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)
(require 'nix-mode)
;; Start in fullscreen mode
(run-at-time 1 nil (lambda () (set-frame-parameter nil 'fullscreen 'fullboth)))
(require 'multiple-cursors)
(require 'powerline)
(powerline-default-theme)
(when-gui
  (load-theme 'clues t)
  (require 'airline-themes)
  (load-theme 'airline-papercolor t))
(add-hook 'haskell-mode-hook 'intero-mode)
(set-default 'truncate-lines t)
(add-hook 'prog-mode-hook 'my-personal-code-style)
(set-face-bold-p 'bold nil)
(require 'helm-config)
(global-set-key (kbd "C-c C-f") 'helm-projectile)
(global-set-key (kbd "M-p") 'helm-projectile-switch-project)

;; (add-hook
;;   'emacs-startup-hook
;;   (lambda ()
;;     (split-window-below)
;;     (other-window 1)
;;     (ansi-term "zsh")
;;     (other-window 1)
;;     (enlarge-window 10)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono Dotted for Powerline" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
