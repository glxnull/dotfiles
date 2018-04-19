;;; init.el --- Personal Emacs Configuration
;;
;; Author: Antonio Campos <geckocore03@outlook.com>
;; URL: https://glxnull.github.io/

;;; Commentary:

;; This file simply sets up my personal settings and all modules
;; I use for making my environment more productive and comfortable.

;;; Code:

;; Package settings
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; General settings
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(setq-default cursor-type 'box)
(global-hl-line-mode t)
(global-linum-mode t)
(setq-default tab-width 4 indent-tabs-mode nil)
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(when (member "Fira Mono" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Fira Mono-10.5"))
  (set-face-attribute 'default t :font "Fira Mono-10.5"))
(setq-default frame-title-format
	      '(:eval
		(format "%s@%s: %s %s"
			(or (file-remote-p default-directory 'user)
			    user-real-login-name)
			(or (file-remote-p default-directory 'host)
			    system-name)
			(buffer-name)
			(cond
			 (buffer-file-truename
			  (concat "(" buffer-file-truename ")"))
			 (dired-directory
			  (concat "{" dired-directory "}"))
			 (t
			  "[no file]")))))
(setq backup-directory-alist '(("." . "~/.baks")))
(setq backup-by-copying t)
(setq global-font-lock-mode t)
(mapc (lambda (face)
     (when (eq (face-attribute face :weight) 'bold)
       (set-face-attribute face nil :weight 'normal)))
      (face-list))
(load-theme 'kaolin-ocean t)

;;; Packages

;; Origami
(require 'origami)
(global-origami-mode t)

;; Highlight matching delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Workspaces in Emacs
(require 'perspeen)
(setq perspeen-use-tab t)
(perspeen-mode t)

;; Colors on code
(require 'rainbow-mode)
(dolist (hooks '(emacs-lisp-mode-hook
                 html-mode-hook
                 css-mode-hook
                 sass-mode-hook
                 js-mode-hook
                 text-mode-hook))
  (add-hook hooks #'rainbow-mode))

;; Status bar
(require 'telephone-line)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-height 24
      telephone-line-evil-use-short-tag t)
(telephone-line-mode t)

;; Show line numbers
(defun initialize-nlinum (&optional frame)
  "Show line numbers in FRAME."
  (require 'nlinum)
  (add-hook 'prog-mode-hook 'nlinum-mode))
(when (daemonp)
  (add-hook 'window-setup-hook 'initialize-nlinum)
  (defadvice make-frame (around toggle-nlinum-mode compile activate)
  (nlinum-mode -1) ad-do-it (nlinum-mode 1)))

;; Completion for braces automatically
(require 'smartparens-config)
(smartparens-global-mode t)

;; Browsing files easily
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq doom-neotree-enable-file-icons t)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons))

;; Snippets
(require 'yasnippet)
(yas-global-mode t)
(add-hook 'term-mode-hook '(lambda ()
                             (setq yas-dont-activate t)))

;; Terminal in Emacs
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; Ido-mode replacement
(require 'helm)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-mini)
(require 'helm-config)
(helm-mode t)

;; Flymake
(require 'flymake)
(defun flymake-get-tex-args (file-name)
  "Check FILE-NAME if is correct."
  (list "pdflatex"
	(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

;; Use math symbols on code
(require 'pretty-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-pretty-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-pretty-mode)

(global-prettify-symbols-mode t)

;; Editorconfig support
(require 'editorconfig)
(editorconfig-mode t)

;; On-the-fly spell checking
(require 'flyspell)
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (mode '(emacs-lisp-mode-hook
		inferior-lisp-mode-hook
		python-mode-hook
		js2-mode-hook))
  (add-hook mode
	    '(lambda ()
	       (flyspell-prog-mode))))
(global-set-key (kbd "<f7>") 'ispell-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check net hightlighted word."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
(global-set-key (kbd "M-<f7>") 'flyspell-check-next-highlighted-word)

;; On-the-fly syntax checking
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)

(defun trivialfis/flycheck ()
  "Add a minibuffer for flycheck errors."
  (add-to-list 'display-buffer-alist
	       `(,(rx bos "*Flycheck errors*" eos)
		 (display-buffer-reuse-window
		  display-buffer-in-side-window)
		 (side            . bottom)
		 (reusable-frames . visible)
		 (window-height   . 0.23)))
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list))
(add-hook 'prog-mode-hook 'trivialfis/flycheck)
(setq-default flycheck-temp-prefix ".flycheck")

(require 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Auto-completion
(require 'company)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-limit 20)
(setq company-selection-wrap-around t)
(define-key company-active-map [tab] 'company-select-next)

(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
(add-hook 'after-init-hook 'global-company-mode)

;; Projects in Emacs
(require 'projectile)
(projectile-mode t)
(setq projectile-enable-caching t)

(require 'grizzl)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-p") 'projectile-switch-to-buffer)

;; Git modifications
(require 'git-gutter)
(global-git-gutter-mode t)
(require 'git-gutter-fringe)
(define-fringe-bitmap 'git-gutter-fr:added
      [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
      nil nil 'center)
(define-fringe-bitmap 'git-gutter-fr:modified
      [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
      nil nil 'center)
(define-fringe-bitmap 'git-gutter-fr:deleted
      [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
      nil nil 'center)
(add-hook 'focus-in-hook 'git-gutter:update-all-windows)

;;; Language support

;; Cpp
(require 'cc-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++14")))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'cmake-mode)
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(require 'cmake-font-lock)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)


(require 'ycmd)
(add-hook 'c-mode-hook #'ycmd-mode)
(add-hook 'c++-mode-hook #'ycmd-mode)
(setq ycmd-server-command '("python" "/home/antonio/.tools/ctools/ycmd/ycmd"))
(setq ycmd-global-config (expand-file-name "/home/antonio/.tools/ycmd/ycm_conf.py"))
(setq ycmd-force-semantic-completion t)

(require 'company-ycmd)
(company-ycmd-setup)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
(add-to-list 'flycheck-checkers 'ycmd)

(add-hook 'python-mode-hook (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))

;; Python
(require 'elpy)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(elpy-enable)

(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
(add-hook 'elpy-mode-hook 'flycheck-mode)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Julia
(require 'julia-mode)
(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))

;; Elixir
(require 'elixir-mode)
(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))

(require 'alchemist)
(setq alchemist-mix-command "/home/antonio/.tools/elixir/bin/mix")
(setq alchemist-iex-program-name "/home/antonio/.tools/elixir/bin/iex")
(setq alchemist-execute-command "/home/antonio/.tools/elixir/bin/elixir")
(setq alchemist-compile-command "/home/antonio/.tools/elixir/bin/elixirc")

;; Web Development
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; Javascript
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers '(javascript-jshint json-jsonlist)))
(flycheck-add-mode 'javascript-eslint 'web-mode)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'company-tern)
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)
                           (company-mode)))

;; Sass
(require 'sass-mode)
(setq exec-path (cons (expand-file-name "/home/antonio/.rvm/gems/ruby-2.5.0/bin") exec-path))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
(add-hook 'sass-mode-hook 'emmet-mode)
(setq flycheck-disabled-checkers
      (append flycheck-disabled-checkers '(scss-lint)))

;; Yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
	  '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Docker
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; LaTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)

(add-hook 'LaTeX-mode-hook 'flymake-mode)

(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(defun turn-on-outline-minor-mode ()
  "Add a minor mode to Latex."
  (outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o")

;;; init.el ends here
