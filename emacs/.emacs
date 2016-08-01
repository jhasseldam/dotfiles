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
 '(default ((t (:family "Ubuntu Mono derivative Powerline" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))

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
  (setq tab-width 2)
  (setq require-final-newline nil))
  ;;(setq indent-line-function 'insert-tab))
(add-hook 'text-mode-hook 'setup-indentation)
(add-hook 'haskell-mode-hook 'setup-indentation)
(add-hook 'fsharp-mode-hook 'setup-indentation)
(add-hook 'csharp-mode-hook 'setup-indentation)
(add-hook 'markdown-mode-hook 'setup-indentation)
(add-hook 'js-mode-hook 'setup-indentation)

;; Packages
(require 'cl)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(defvar my-packages
  '(
    use-package
    neotree
    projectile
    helm-projectile
    magit
    intero
    markdown-mode
    csharp-mode
    fsharp-mode
    purescript-mode
    gitignore-mode
    dockerfile-mode
    yaml-mode
    monokai-theme
    suscolors-theme
    twilight-bright-theme
   )
)

;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
(setq url-http-attempt-keepalives nil)

(defun packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (unless package-archive-contents (package-refresh-contents))
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Setup projectile
(projectile-mode 1)

;; Setup Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Setup intero
(add-hook 'haskell-mode-hook 'intero-mode)

;; Setup fsharp
(setq-default fsharp-indent-offset 2)

;; Setup theme
(when (display-graphic-p)
  ;; (require 'twilight-bright-theme)
  ;; (load-theme 'twilight-bright t)
  (load-theme 'wombat t)
)

;; Use findstr for grep-find function on Windows
(when (string-equal system-type "windows-nt")
  (setq grep-find-command '("findstr /sn *" . 13))
)

;; Key bindings
(global-set-key (kbd "C-x d") 'neotree)
(global-set-key (kbd "C-x f") 'helm-projectile)
(global-set-key (kbd "C-x c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)

;; ;; Set Frame width/height
;; (when (display-graphic-p)
;;   (defun arrange-frame (w h x y)
;;     "Set the width, height, and x/y position of the current frame"
;;     (let ((frame (selected-frame)))
;;       (delete-other-windows)
;;       (set-frame-position frame x y)
;;       (set-frame-size frame w h)))
;;   (arrange-frame 120 40 10 10)
;; )

(defun close-all-buffers ()
(interactive)
  (mapc 'kill-buffer (buffer-list)))
