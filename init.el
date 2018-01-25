(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line

;; load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(package-selected-packages
   (quote
    (go-mode web-mode exec-path-from-shell flycheck ecb auto-complete yasnippet find-file-in-project magit edit-server js2-mode spacemacs-theme markdown-mode flymake-jslint))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-theme 'spacemacs-dark t)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.marko\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
;  (set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "Pink3")
;  (set-face-attribute 'web-mode-html-attr-custom-face nil :foreground "Pink3")
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-attr-indent-offset 4)
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(load-theme 'classic t t)
(enable-theme 'classic)

(global-set-key (kbd "C-x g") 'magit-status)

;; set command as control
(setq mac-command-modifier 'control)

;;js2-mode
(setq js-indent-level 4)
(setq js-switch-indent-offset 4)

;(setq-default tab-width 4 indent-tabs-mode nil) ;; disable tab

(exec-path-from-shell-initialize)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(require 'go-autocomplete)
(require 'auto-complete-config)
;;auto complete
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(global-auto-complete-mode "enter")
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-modes
      (append ac-modes
              (list 'js2-mode 'js2-jsx-mode)))

(require 'yasnippet)
(yas-global-mode 1)

(global-set-key "\M- " 'hippie-expand)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;;(use-package flycheck
  ;;:ensure t
  ;;:init (global-flycheck-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
;;(require 'ecb)

(global-set-key (kbd "C-x f") 'find-file-in-project)

(require 'edit-server)
(edit-server-start)
