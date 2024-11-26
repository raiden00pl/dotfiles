(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-firefox-program "palemoon")
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c71fd8fbda070ff5462e052d8be87423e50d0f437fbc359a5c732f4a4c535c43" default))
 '(org-agenda-files
   '("/media/veracrypt1/mygtd.org" "/media/veracrypt1/home/habits.org"))
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame)))
 '(package-selected-packages
   '(org-ref auto-compile nlinum tj3-mode org-contrib yaml-mode elpy elfeed-org bind-key let-alist org-bullets request request-deferred deferred diminish jinja2-mode clang-format htmlize expand-region hungry-delete beacon gdb darkokai-theme anti-zenburn-theme hc-zenburn-theme zenburn-theme monokai markdown-mode-hook plantuml-mode plantuml avy tabbar-ruler bibtex-utils lua-mode comment-dwim-2 ws-butler undo-tree magit helm-swoop helm-projectile helm-gtags ggtags elfeed-web duplicate-thing dtrt-indent company-c-headers clean-aindent-mode))
 '(sp-override-key-bindings '(("C-M-a") ("C-M-e"))))
'(safe-local-variable-values
  (quote
   ))

;; increase garbage collector threshold
(setq gc-cons-threshold 100000000)

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; prefer new configs
(setq loat-prefer-newer t)
(package-initialize)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(setq use-package-always-ensure t)

(use-package try)

(use-package which-key
  :config
  (which-key-mode)
  )

(use-package avy
  :bind (("C-;" . avy-goto-word-1)
         ("M-g g" . avy-goto-line))
  )

(setq ad-redefinition-action 'accept)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(defun prev-window ()
 (interactive)
 (other-window -1)
 )

(define-key input-decode-map "\033[39;6~" (kbd "C-'"))
(define-key input-decode-map "\033[42;6~" (kbd "C-\""))
(define-key input-decode-map "\033[43;6~" (kbd "C-+"))
(define-key input-decode-map "\033[44;6~" (kbd "C-,"))
(define-key input-decode-map "\033[45;6~" (kbd "C--"))
(define-key input-decode-map "\033[46;6~" (kbd "C-."))
(define-key input-decode-map "\033[58;6~" (kbd "C-:"))
(define-key input-decode-map "\033[59;6~" (kbd "C-;"))
(define-key input-decode-map "\033[61;6~" (kbd "C-="))
(define-key input-decode-map "\033[63;6~" (kbd "C-?"))
(define-key input-decode-map "\033[48;6~" (kbd "C-0"))
(define-key input-decode-map "\033[49;6~" (kbd "C-1"))
(define-key input-decode-map "\033[50;6~" (kbd "C-2"))
(define-key input-decode-map "\033[51;6~" (kbd "C-3"))
(define-key input-decode-map "\033[52;6~" (kbd "C-4"))
(define-key input-decode-map "\033[53;6~" (kbd "C-5"))
(define-key input-decode-map "\033[54;6~" (kbd "C-6"))
(define-key input-decode-map "\033[55;6~" (kbd "C-7"))
(define-key input-decode-map "\033[56;6~" (kbd "C-8"))

;; custom keys
(global-set-key (kbd "C-0") 'yank-to-x-clipboard)
(global-set-key (kbd "C-c C-e") 'eval-buffer)
(global-set-key (kbd "C-5") 'revert-buffer)
(define-key global-map (kbd "M-j") 'previous-buffer)
(define-key global-map (kbd "M-l") 'next-buffer)
(define-key global-map (kbd "C-x p") 'prev-window)
(define-key global-map (kbd "C-c k") 'helm-calcul-expression)
(global-set-key (kbd "C-'") 'isearch-forward-regexp)
(global-set-key (kbd "C-\"") 'query-replace-regexp)

;; make buffer switch command auto suggestions, also for find-file command
(setq ido-enable-flex-matching t)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

;; copy to clipboard
(defun yank-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
        (message "Yanked region to clipboard!")
        (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))


;; show line numbe
(use-package linum
  :init
  (setq linum-format "%4d \u2502 ")
  :config
  (global-linum-mode 1)
  )

(use-package plantuml-mode
  :init
  (setq plantuml-jar-path "/opt/plantuml/plantuml.jar")
  :config
  (add-to-list 'auto-mode-alist '("\\.pu$" . plantuml-mode))
  )

(use-package markdown-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (add-hook 'markdown-mode-hook (lambda ()(visual-line-mode)))
  )

;; stackexchange client
(use-package sx
  :bind ("C-c os" . sx-search)
  )

;;
(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-editing)
(require 'setup-org)
(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'setup-ggtags)
(require 'setup-python)
(require 'setup-elfeed)



;; Compilation
(global-set-key (kbd "C-c p") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'projectile-compile-project)))

;; gdb
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

;; company
(use-package cc-mode)

(use-package company-c-headers)

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'c-mode-common-hook   'hs-minor-mode)
  :config
  (define-key c-mode-map  [(backtab)] 'company-gtags)
  (define-key c++-mode-map  [(backtab)] 'company-gtags)
  (delete 'company-semantic company-backends)
  )

(use-package projectile
  :bind-keymap ("M-p" . projectile-command-map)
  :init
  (add-hook 'c-mode-hook 'projectile-mode)
  (add-hook 'python-mode-hook 'projectile-mode)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'alien)
  (setq projectile-use-git-grep t)
  )

;; (use-package helm-projectile
;;   :init
;;   (helm-projectile-on)
;;   :config
;;   (setq projectile-completion-system 'helm)
;;   (setq projectile-indexing-method 'alien)
;;   )

(use-package magit
  :bind ("C-x g" . magit-status)
  )

(use-package jinja2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.tmpl$" . jinja2-mode))
)

(use-package zotxt)

(use-package lua-mode)

(use-package lua-mode)

(use-package bibtex-utils)

;;(use-package org-plus-contrib)

;;jedi (auto completion for python)
;; (use-package jedi
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)
;;)

;; load theme
(use-package monokai-theme
  :config
  (load-theme 'monokai)
  )

;; smart-mode-line
(use-package smart-mode-line
  :init
  (setq sml/theme 'dark)
  :config
  (sml/setup)
)

;;(add-to-list 'sml/replacer-regexp-list '("^/media/veracrypt1" ":Org:") t)

;; disabling menu bar
(menu-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face ((t (:background "#e52b50" :foreground "black"))))
 '(avy-lead-face-0 ((t (:background "#4f57f9" :foreground "black"))))
 '(avy-lead-face-1 ((t (:background "gray" :foreground "black"))))
 '(avy-lead-face-2 ((t (:background "#f86bf3" :foreground "black"))))
 '(highlight ((t (:background "darkolivegreen" :foreground "color-16"))))
 '(mode-line ((t (:background "color-59" :foreground "color-16" :inverse-video nil))))
 '(org-column-title ((t (:background "grey30" :foreground "red" :underline t :weight bold))))
 '(rst-level-1 ((t (:background "color-21"))))
 '(rst-level-2 ((t (:background "color-26"))))
 '(table-cell ((t (:background "brightmagenta" :foreground "color-19" :inverse-video nil)))))
