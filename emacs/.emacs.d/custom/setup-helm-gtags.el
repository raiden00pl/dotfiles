(use-package helm-gtags
  :bind (("C-c g a" . helm-gtags-tags-in-this-function)
         ("C-j" . helm-gtags-select)
         ("M-." . helm-gtags-dwim)
         ("M-," . helm-gtags-pop-stack)
         ("C-c <" . helm-gtags-previous-history)
         ("C-c >" . helm-gtags-next-history))
  :init
  (setq
   helm-gtags-ignore-case t
   helm-gtags-auto-update t
   helm-gtags-use-input-at-cursor t
   helm-gtags-pulse-at-cursor t
   helm-gtags-prefix-key "\C-cg"
   helm-gtags-suggested-key-mapping t
   )
  ;; Enable helm-gtags-mode in Dired so you can jump to any tag
  ;; when navigate project tree with Dired
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  ;; Enable helm-gtags-mode in Eshell for the same reason as above
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  ;; Enable helm-gtags-mode in languages that GNU Global supports
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'java-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  )

(provide 'setup-helm-gtags)
