(use-package elfeed
  :bind ("C-x w" . elfeed)
)

(use-package elfeed-org
  :config
  (setq rmh-elfeed-org-files (list "/media/veracrypt1/elfeed.org"))
  (elfeed-org)
)


(defface important-elfeed-entry
  '((t :foreground "#f77"))
  "Marks an important Elfeed entry.")

(push '(important important-elfeed-entry)
      elfeed-search-face-alist)

(provide 'setup-elfeed)
