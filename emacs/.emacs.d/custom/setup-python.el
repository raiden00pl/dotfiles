(use-package elpy
  :ensure t
  :bind (("M-," . elpy-goto-definition))
  :bind (("M-/" . pop-tag-mark))
  :init
  ;; (add-hook 'inferior-python-mode-hook (lambda () (setq truncate-lines t)))
  ;; (add-hook 'python-mode-hook 'company-mode)
  ;; (add-hook 'inferior-python-mode-hook 'company-mode)
  (add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
  (elpy-enable)
  )

;; use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(use-package flycheck
  :init
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'setup-python)
