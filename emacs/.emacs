;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)
(require 'tramp)
(require 'ido)
(ido-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(org-log-done (quote note))
 '(package-selected-packages (quote (powerthesaurus dash s popup yasnippet company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)
(global-set-key (kbd "C-c C-f") 'query-replace)
(global-set-key (kbd "C-c C-g") 'goto-line)

;; this saves autosave and backups to /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; org-mode stuff
(global-set-key (kbd "C-c c")
       'org-capture)


(setq org-capture-templates
      '( ("b" "Blog idea" entry (file+headline "~/orgfiles/i.org" "Blog Topics:")
	  "* %?\n %T " :prepend t)
	 ("l" "Link" entry (file+headline "~/orgfiles/links.org" "Links")
	  "* %? %^L %^g \n%T" :prepend t)))


;; highlight matching paranthesis
(show-paren-mode 1)

;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; line number
(global-linum-mode 1)

;; do not show default startup screen
(setq inhibit-startup-message t)

;; hide menu bar, scrollbar and toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; theme settings use powerline mode line
;;(require 'powerline)
;;(powerline-default-theme)
;;(set-background-color "gray10")
;;(set-foreground-color "white")

(require 'package)

(setq package-archives (append '(("melpa-stable" . "https://stable.melpa.org/packages/")
                                 ("melpa" . "https://melpa.org/packages/")
                                 ("marmalade" . "http://marmalade-repo.org/packages/"))
                               package-archives)

      package-archive-priorities '(("melpa" . 10)
                                   ("marmalade" . 5)
                                   ("gnu" . 0)
                                   ("melpa-stable" . -5))

      package-selected-packages '(;; Eclim Dependencies
                                  dash
                                  s
                                  popup
                                  yasnippet
                                  ;; Eclim Optional Dependencies
                                  company)

      ;; After adding a new pinned repository you MUST run
      ;; `package-refresh-contents' before installing the package.
      package-pinned-packages nil)

(package-initialize)


;; some magit commands
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; setting debug flag on 
(setq debug-on-error t)

;; smex bindings
(global-set-key (kbd "M-x") 'smex)


;; autocomplete
(ac-config-default)

(set-face-attribute 'default nil :height 140)
