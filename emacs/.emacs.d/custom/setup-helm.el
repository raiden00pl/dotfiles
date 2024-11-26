(use-package helm
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-h SPC" . helm-all-mark-rings)
         ;; ("C-c h o" . helm-occur)
         ;; ("C-c h C-c w" . helm-wikipedia-suggest)
         ;; ("C-c h x" . helm-register)
         ("C-x r j" . jump-to-register)
         ("C-c C-s". helm-multi-swoop-all)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action) ; rebihnd tab to do persistent action
         ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
         ("C-z" . helm-select-action) ; list actions using C-z
         :map helm-grep-mode-map
         ("<return>" . helm-grep-mode-jump-other-window)
         ("n" . helm-grep-mode-jump-other-window-forward)
         ("p" . helm-grep-mode-jump-other-window-backward)
         :map minibuffer-local-map
         ;; show minibuffer history with Helm
         ("M-p" . helm-minibuffer-history)
         ("M-n" . helm-minibuffer-history))
  :init
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  (setq
   helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
   helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
   helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
   helm-candidate-number-limit 500 ; limit the number of displayed canidates
   helm-ff-file-name-history-use-recentf t
   helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
   helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
   )
  ;; use helm to list eshell history
  (add-hook 'eshell-mode-hook
            #'(lambda ()
                (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))
  ;; Save current position to mark ring
  (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)
  :config
  (global-linum-mode t)
  (helm-mode 1)
  )

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-unset-key (kbd "C-x c"))

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

(define-key global-map [remap find-tag] 'helm-etags-select)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

(use-package helm-swoop
  :bind (("C-c s" . helm-swoop)
         ;; ("C-c s" . helm-multi-swoop-all)
         :map isearch-mode-map
         ("M-i" . helm-swoop-from-isearch)
         :map helm-swoop-map
         ("M-i" . helm-multi-swoop-all-from-helm-swoop))
  :init
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows t)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color t)
  )

(provide 'setup-helm)
