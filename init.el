;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Base

(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

(global-visual-line-mode t)
(global-hl-line-mode 1)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(global-linum-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fonts

;; (set-face-font 'default "-adobe-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-face-font 'default "-firacode-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; straight installer

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package helm
  :straight t
  :ensure t
  :config
  (bind-key "C-x b" 'helm-buffers-list)
  (bind-key "C-x C-b" 'helm-buffers-list)
  ;; (bind-key "M-x" 'helm-M-x)
  )

(use-package projectile
  :straight t
  :ensure t
  :config
  (bind-key "C-c p f" 'projectile-find-file)
  (bind-key "C-c p k" 'projectile-kill-buffers))

(use-package magit
  :straight t
  :ensure t
  :init
  (bind-key "C-c m g" 'magit-status)
  (bind-key "C-c m b" 'magit-blame)
  (bind-key "C-c m q" 'magit-blame-quit))

;; (use-package git-gutter
;;   :straight t
;;   :ensure t
;;   :init
;;   (global-git-gutter-mode 1))

(use-package company
  :straight t
  :ensure t
  :config
  (global-company-mode))

(use-package company-statistics
  :straight t
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-statistics-mode))

(use-package paredit
  :straight t
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "" t))

(use-package undo-tree
  :straight t
  :ensure t
  :config (global-undo-tree-mode))

(use-package rainbow-delimiters
  :straight t
  :ensure t)

(use-package highlight-parentheses
  :straight t
  :ensure t)

(use-package auto-highlight-symbol
  :straight t
  :ensure t)

(use-package duplicate-thing
  :straight t
  :ensure t)

(use-package helm-cider
  :straight t
  :ensure t)

(use-package ido
  :straight t
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1))

(defun my-cider-mode-hook ()
  (paredit-mode 1)
  (rainbow-delimiters-mode 1)
  (helm-cider-mode 1)
  (eldoc-mode 1))

(use-package cider
  :straight t
  :ensure t
  :config
  (add-hook 'cider-repl-mode-hook #'my-cider-mode-hook)
  (add-hook 'cider-mode-hook #'my-cider-mode-hook))

(defun my-clj-mode-hook ()
  (paredit-mode 1)
  (eldoc-mode 1)
  (rainbow-delimiters-mode 1)
  (highlight-parentheses-mode 1)
  (auto-highlight-symbol-mode 1))

(use-package clojure-mode
  :straight t
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'my-clj-mode-hook))

(use-package golden-ratio
  :straight t
  :ensure t
  :config
  (golden-ratio-mode 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unset stupid suspend keystokes
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font sizing
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
