(tool-bar-mode -1)
(menu-bar-mode -1)
(setq c-default-style "bsd" c-basic-offset 2)
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(setq column-number-mode t)
(setq initial-scratch-message "")
(setq visible-bell t)
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
			  'company
			  'company-c-headers
			  'company-cmake
			  'epl
			  'flycheck
			  'flycheck-pos-tip
			  'glsl-mode
			  'list-packages-ext
			  'nyan-mode
			  'pkg-info)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/OGRE")))
 '(custom-safe-themes
   (quote
    ("a0d03c985723011f31ce36419907d341067b673caccf652fe7b51bbc601ae6b1" default)))
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/home/joseph/workspace/thatproject2")))
 '(safe-local-variable-values (quote ((cmake-project-mode)))))
(require 'cpputils-cmake)
(require 'autopair)
(require 'flycheck)
(require 'color)
(require 'company-c-headers)
(require 'cmake-project)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0c0c0c"))))
 '(company-tooltip ((t (:inherit default :background "#050505"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))
(load-theme 'wheatgrass-mod t)
(define-minor-mode topbar-mode
  "Modeline at the top"
  :lighter " mlt"
  (setq header-line-format mode-line-format mode-line-format nil))
(add-hook 'prog-mode-hook 'topbar-mode)
(add-hook 'text-mode-hook 'topbar-mode)
(add-hook 'help-mode-hook 'topbar-mode)
(add-hook 'c-mode-hook (lambda () (cppcm-reload-all)))
(add-hook 'c++-mode-hook (lambda () (cppcm-reload-all)))
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(progn
     (add-to-list 'company-backends 'company-c-headers)))
(setq company-clang-arguments
     '("-std=c++11"
       "-stdlib=libc++"
       "-I/usr/include/c++/v1"
       "-I/usr/include"
       "-I/usr/include/c++/4.9.1/"
       "-I/usr/include/c++/4.9.1/x86_64-unknown-linux-gnu"
       "-I/usr/include/OGRE"))
(autopair-global-mode 1)
(setq autopair-autowrap t)
(defun indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
      (company-complete-common)
    (indent-according-to-mode)))
(global-set-key "\t" 'company-complete-common)
(setq ecb-tip-of-the-day nil)
(global-linum-mode 1)
(setq make-backup-files nil)
(nyan-mode)
(nyan-start-animation)
(setq nyan-wavy-trail t)
(put 'upcase-region 'disabled nil)
