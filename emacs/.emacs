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
(require 'cl)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(defvar my-packages
  '(
    use-package
    neotree
    grizzl
    fiplr
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

;; Setup fiplr
(use-package fiplr)
;; (setq-default fiplr-root-markers '(".git" ".svn"))
(setq-default fiplr-ignored-globs
  '(
    (directories
     (
      ".git"
      ".svn"
      ".hg"
      ".bzr"
      "node_modules"
      "bower_components"
      "packages"
      "bin"
      "obj"
      "tools"
     )
    )
    (files
     (
      ".#*"
      "*~"
      "*.dll"
      "*.exe"
      "*.so"
      "*.o"
      "*.obj"
      "*.jpg"
      "*.png"
      "*.gif"
      "*.pdf"
      "*.gz"
      "*.zip"
     )
    )
  )
)

;; Setup intero
(add-hook 'haskell-mode-hook 'intero-mode)

;; Setup theme
(when (display-graphic-p)
  (load-theme 'suscolors t)
)

;; Adjust PATH on Windows (remember to install find utils from GnuWin32 package)
(when (string-equal system-type "windows-nt")
  (setenv "PATH"
    (concat
     "C:/Program Files (x86)/GnuWin32/bin" ";"
     "C:/Program Files/Git/bin" ";"
      (getenv "PATH")
    )
  )
  (setq exec-path '("C:/Program Files (x86)/GnuWin32/bin"))
  (setq exec-path '("C:/Program Files/Git/bin"))
)

;; Key bindings
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(global-set-key (kbd "C-x d") 'neotree)
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
