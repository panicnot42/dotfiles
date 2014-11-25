(tool-bar-mode -1)
(menu-bar-mode -1)
(setq c-default-style "bsd" c-basic-offset 2)
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(setq column-number-mode t)
(setq initial-scratch-message "")
(setq visible-bell t)
(setq indent-tabs-mode nil)
(scroll-bar-mode 0)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
Return a list of installed packages or nil for every package not installed."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         package
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         nil)))
   packages))
(ensure-package-installed 'autopair
			  'cmake-project
			  'epl
			  'flycheck
			  'flycheck-pos-tip
			  'glsl-mode
			  'list-packages-ext
			  'nyan-mode
			  'pkg-info)
(custom-set-variables
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   (quote
    ("a0d03c985723011f31ce36419907d341067b673caccf652fe7b51bbc601ae6b1" default)))
 '(safe-local-variable-values (quote ((cmake-project-mode)))))
(require 'cpputils-cmake)
(require 'autopair)
(require 'flycheck)
(require 'color)
(require 'cmake-project)
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant italic :weight normal :height 113 :width normal :foundry "unknown" :family "Envy Code R")))))
(load-theme 'wheatgrass-mod t)
(define-minor-mode topbar-mode
  "Modeline at the top"
  :lighter " mlt"
  (setq header-line-format mode-line-format mode-line-format nil))
(add-hook 'compilation-mode-hook 'topbar-mode)
(add-hook 'fundamental-mode-hook 'topbar-mode)
(add-hook 'c-mode-hook (lambda () (cppcm-reload-all)))
(add-hook 'c++-mode-hook (lambda () (cppcm-reload-all)))
(define-globalized-minor-mode global-topbar-mode topbar-mode topbar-mode)
(add-hook 'after-init-hook 'global-topbar-mode)
(autopair-global-mode 1)
(setq autopair-autowrap t)
(global-linum-mode 1)
(setq make-backup-files nil)
(nyan-mode)
(nyan-start-animation)
(setq nyan-wavy-trail t)
(put 'upcase-region 'disabled nil)
(show-paren-mode 1)
(setq show-paren-delay 0)
