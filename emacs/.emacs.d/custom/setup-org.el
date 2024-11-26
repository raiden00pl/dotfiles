(use-package org
  :bind (("C-c C-g" . org-set-tags)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c t" . org-todo)
         ("C-c c" . org-capture)
         ("C-c C-\\" . org-remove-occur-highlights)
         ("C-c p" . org-pomodoro))
  :init
  (setq org-log-done t)
  (setq org-directory "/media/veracrypt1/")
  (setq org-mygtd-file (concat org-directory "/mygtd.org"))
  (setq org-refile-targets (quote ((org-mygtd-file :maxlevel . 1) )))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "mygtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("n" "Note" entry (file+headline "notes/capture.org" "Note")
           "* %? \n%U\n%a\n %i")
          ("i" "Ideas" entry (file+headline "ideas/capture.org" "Ideas")
           "* %?")
          ("j" "Journal" entry (file+datetree "journals/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("w" "Week rewiev" entry (file+datetree "journals/week_rewiev.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ))
  (setq org-agenda-files
        (list
         (concat org-directory "/home/habits.org")
         (concat org-directory "/mygtd.org")
         ))
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-restore-windows-after-quit 1)
  (setq org-agenda-window-setup 'current-window)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "STARTED" "DONE(d!/!)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "SOMEDAY(o)" "|" "CANCELLED(c@/!)")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning) ("STARTED" . "yellow")
          ("CANCELED" . (:foreground "blue" :weight bold))))
  (setq org-pomodoro-long-break-frequency 4
        org-pomodoro-length 25
        org-pomodoro-short-break-length 5
        org-pomodoro-long-break-length 20
        )
  (setq org-tags-column 90)
  (add-hook 'org-capture-mode-hook 'delete-other-windows)
  :config
  (require 'org-habit)
  (define-key org-mode-map (kbd "C-'") nil)
  )

(require 'ox-taskjuggler)
(require 'tj3-mode)

(provide 'setup-org)

;; org-roam doesn't load well without this
(require 'org-ref)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "/media/veracrypt1/roam")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("b" "business" plain
      (file "/media/veracrypt1/roam-templates/business.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Business")
      :unnarrowed t)
     ("l" "blog" plain
      (file "/media/veracrypt1/roam-templates/blog.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Blog")
      :unnarrowed t)
     ("p" "project" plain
      (file "/media/veracrypt1/roam-templates/projects.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config

  (org-roam-db-autosync-enable)
  )
