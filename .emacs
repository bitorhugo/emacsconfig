;; melpa
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; make sure that use-package is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; (use-package foo) -> loads package named foo iff foo is available on system
;; :init   -> execute code before package is loaded
;; :config -> execute code after package is loaded

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  :config
  (global-company-mode))

(use-package smex
  :ensure t
  :bind
  ("M-x" . smex)
  :config
  (smex-initialize))

(use-package smartparens
  :ensure t
  :init (require 'smartparens-config)
  :config (smartparens-global-mode t))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package flycheck
  :ensure t
  :unless ".emacs"
  :config (global-flycheck-mode))

(use-package projectile
  :ensure t
  :config (projectile-mode t)
  )

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package origami
  :ensure t
  :bind (("C-c o" . origami-open-node)
         ("C-c c" . origami-close-node))
  :config (origami-mode))

(use-package treemacs
  :ensure t
  :bind ("C-c t" . treemacs-select-window)
  :config (setq treemacs-is-never-other-window t))

(use-package lsp-mode
  :ensure t
  :bind ("C-c a" . lsp-execute-code-action)
  )

(use-package dap-mode
  :ensure t
  :after lsp-mode
  )

(use-package lsp-ui
  :ensure t
  :bind
  ("C-c r" . lsp-ui-peek-find-references)
  ("C-c d" . lsp-ui-peek-find-definitions)
  :init
  (setq lsp-ui-doc-delay 0.5)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-show-with-mouse t)
  :config (lsp-ui-mode)
  )

(use-package pyvenv
  :ensure t)

(require 'dap-python)
;; if you installed debugpy, you need to set this
;; https://github.com/emacs-lsp/dap-mode/issues/306
(setq dap-python-debugger 'debugpy)

(use-package lsp-java
  :ensure t
  :config (add-hook 'java-mode-hook #'lsp))

(use-package dap-java
  :ensure nil
  )

(use-package go-mode
  :ensure t
  :hook (go-mode . lsp-deferred)
  (before-save-hook . lsp-format-buffer)
  (before-save-hook . lsp-organize-imports)
  (before-save-hook . lsp-go-install-save-hooks)
  )

;; (use-package sly
;;   :ensure t)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-dart
  :ensure t
  :config (add-hook 'dart-mode-hook #'lsp))

;; slime
(setq inferior-lisp-program "sbcl")

;; add hoks to c-modes
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(require 'dap-cpptools)

;; java spring
;; (require 'lsp-java-boot)
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

;; delve
(require 'dap-dlv-go)

(pending-delete-mode t)

;; visual edits
(setq inhibit-startup-message t)
(setq column-number-mode t)
(global-display-line-numbers-mode t)
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

(global-unset-key (kbd "C-z"))

;; custom commands
(defun jcompile (args)
  (interactive "MArgs: ")
  (shell-command (concat ". ~/projects/JCompile/build.sh" " " args)))

;; allow symlinks
(setq vc-follow-symlinks t)

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
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes
   '("c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "b66970f42d765a40fdb2b6b86dd2ab6289bed518cf4d8973919e5f24f0ca537b" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "9391c58ad6369680c0caf4b98e6ea73c2b4982ab3e374db5e2b715e3fa39cb93" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "308fc0c8cee43c5fccf3efa360c9cdf7d6bbbebc5c2f76850f1b1c8ac8fbaca0" "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" "e5705b0f6df8702eebb5fb0af0ed6fdc306e087be47b4ec53a6edab1ab7da15d" "c8848a260bc461cd099ef92d7c29fb41f87416f8a32fab2c9d9b27ff41b84922" "17fd3a675a6932f0c4156965d0af580358582c009e990b2271706527ef9654c8" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(display-line-numbers-type 'relative)
 '(frame-brackground-mode 'dark)
 '(global-display-line-numbers-mode t)
 '(ispell-dictionary nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(origami pyvenv pyenv lsp-dart yasnippet lsp-intellij org org-mode lsp-pyright python-mode slime cyberpunk-theme CyberPunk lsp-java dap-mode ccls flycheck which-key smartparens-config use-package yaml-mode fold-this undo-tree lsp-ui vterm projectile sweet-theme expand-region phpunit web-mode go-mode lsp-mode company magit tuareg ace-jump-mode smartparens php-mode gruber-darker-theme evil smex))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021"))
 '(safe-local-variable-values '((eval when (fboundp 'rainbow-mode) (rainbow-mode 1))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight bold :height 120 :width normal)))))
