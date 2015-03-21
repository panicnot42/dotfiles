;; Base emacs customizations
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq c-default-style "bsd" c-basic-offset 2)
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(setq column-number-mode t)
(setq initial-scratch-message "")
(setq visible-bell t)
(scroll-bar-mode 0)
(global-linum-mode 1)
(setq make-backup-files nil)
(put 'upcase-region 'disabled nil)
(load-theme 'wheatgrass t)
(define-minor-mode topbar-mode
  "Modeline at the top"
  :lighter " mlt"
  (setq header-line-format mode-line-format mode-line-format nil))
;;(add-hook 'prog-mode-hook 'topbar-mode)
;;(add-hook 'text-mode-hook 'topbar-mode)
;;(add-hook 'help-mode-hook 'topbar-mode)

;; Initialize packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(setq package-list '(company
                     company-irony
                     helm
                     irony
                     projectile))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Load CEDET
;;(load-file "~/.emacs.d/cedet-bzr/trunk/cedet-devel-load.el")

;; Setup Semantic
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
;;(require 'semantic/ia)
;;(require 'semantic/bovine/clang)
(semantic-mode 1)
(defun semantic-hook ()
  (imenu-add-to-menubar "TAGS")) ;; imenu integration; not sure if needed
(add-hook 'semantic-init-hooks 'semantic-hook)
(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

;; Setup EDE
(global-ede-mode t)

;; Setup Irony
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; Setup Company
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-hook 'after-init-hook 'global-company-mode)

;; Setup Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Custom set
;; Groups customized:
;;   - irony
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(irony-lang-compile-option-alist (quote ((c++-mode . "c++") (c-mode . "c"))))
 '(irony-supported-major-modes (quote (c++-mode c-mode))))
