(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


;; smartparens
(require 'smartparens-config)
;; add smartparens to all buffer types :)
(add-hook 'buffer-list-update-hook #'smartparens-mode)

;; company 
(require 'company)
(global-company-mode)

;; lsp
(require 'lsp-mode)
(add-hook 'php-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(setq web-mode-engines-alist
  '(("blade"  . "\\.blade\\."))
)

;; visual stuff
(setq inhibit-startup-message t)
(setq column-number-mode t)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(ido-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes '(gruvbox))
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(display-line-numbers-type 'relative)
 '(frame-brackground-mode 'dark)
 '(global-display-line-numbers-mode t)
 '(ispell-dictionary nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(web-mode gruvbox-theme go-mode lsp-mode company magit tuareg ace-jump-mode smartparens php-mode gruber-darker-theme evil smex))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021"))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Fixed" :foundry "UKWN" :slant normal :weight bold :height 120 :width normal)))))



