(package-initialize)

;; global variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (ample)))
 '(global-linum-mode t)
 '(haskell-font-lock-haddock nil)
 '(haskell-font-lock-symbols (quote unicode))
 '(haskell-mode-hook (quote (capitalized-words-mode imenu-add-menubar-index turn-on-eldoc-mode turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indent turn-on-haskell-indentation turn-on-haskell-simple-indent)))
 '(ido-enable-flex-matching nil)
 '(ido-mode (quote buffer) nil (ido))
 '(inhibit-startup-screen t)
 '(linum-format " %3d ")
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(scroll-bar-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil))

;; fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "outline" :family "Envy Code R")))))

;; setup the default emacs window size
(if window-system
  (set-frame-size (selected-frame) 110 30))

;; use spaces instead of tabs of width 2
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 200 2))
