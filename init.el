(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete yasnippet find-file-in-project magit edit-server js2-mode spacemacs-theme markdown-mode flymake-jslint))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-theme 'spacemacs-dark t)

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(load-theme 'classic t t)
(enable-theme 'classic)

(global-set-key (kbd "C-x g") 'magit-status)

;; set command as control
(setq mac-command-modifier 'control)

;;js2-mode
(setq js-indent-level 2)
(setq js-switch-indent-offset 2)

(setq-default tab-width 4 indent-tabs-mode nil) ;; disable tab

;;auto complete
(ac-config-default)
(global-auto-complete-mode "enter")
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-modes
      (append ac-modes
              (list 'js2-mode 'js2-jsx-mode)))

(require 'yasnippet)
(yas-global-mode 1)

(global-set-key "\M- " 'hippie-expand)

(require 'edit-server)
(edit-server-start)
