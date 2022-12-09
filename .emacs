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

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; sonar lint
;; (require 'lsp-sonarlint)
;; (require 'lsp-sonarlint-php)
;; (setq lsp-sonarlint-php-enabled t)

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

;; pending delete mode
(pending-delete-mode t)

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

;; allow symlinks
(setq vc-follow-symlinks t)

;; add personal theme to theme list
(add-to-list 'custom-theme-load-path
             "/home/bitor/projects/ruber-darker-theme")

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
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("308fc0c8cee43c5fccf3efa360c9cdf7d6bbbebc5c2f76850f1b1c8ac8fbaca0" "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" "e5705b0f6df8702eebb5fb0af0ed6fdc306e087be47b4ec53a6edab1ab7da15d" "c8848a260bc461cd099ef92d7c29fb41f87416f8a32fab2c9d9b27ff41b84922" "17fd3a675a6932f0c4156965d0af580358582c009e990b2271706527ef9654c8" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(display-line-numbers-type 'relative)
 '(frame-brackground-mode 'dark)
 '(global-display-line-numbers-mode t)
 '(ispell-dictionary nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(expand-region phpunit web-mode gruvbox-theme go-mode lsp-mode company magit tuareg ace-jump-mode smartparens php-mode gruber-darker-theme evil smex))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021"))
 '(safe-local-variable-values '((eval when (fboundp 'rainbow-mode) (rainbow-mode 1))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Term" :foundry "UKWN" :slant normal :weight semi-bold :height 128 :width normal)))))
