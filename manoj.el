;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

;; Rinari tage
(setq rinari-tags-file-name "TAGS")

;; Color Theme
(color-theme-twilight)

;; Magit - Installed from http://github.com/philjackson/magit
(require 'magit)

;; YaSnippet
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet-0.6.1c/snippets")

(add-to-list 'load-path "~/.emacs.d/vendor/project-mode/")
(require 'project-mode)
(project-load-all)

;;; TwiterMode - http://www.emacswiki.org/emacs/TwitteringMode
(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode")
(require 'twittering-mode)
;;; (twittering-icon-mode) ;;; Shows profile icons

;; Gnus for GMail
;; (add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
;;                                   (nnimap-address "imap.gmail.com")
;;                                   (nnimap-server-port 993)
;;                                   (nnimap-stream ssl)))

;;(load "gnuserv-compat")
;;(load-library "gnuserv")
;;(gnuserv-start)

;; When loading files reuse existing frames.
(setq gnuserv-frame (car (frame-list)))

;; android-mode
(add-to-list 'load-path "~/.emacs.d/vendor/android-mode")
(require 'android-mode)
;;; (defcustom android-mode-sdk-dir "~/opt/android");; Find out why
;;; this is failing

(global-set-key (kbd "C-x m") 'eshell-command)

;; Scala Mode
(add-to-list 'load-path "~/.emacs.d/vendor/scala-mode")
(require 'scala-mode-auto)
;; (setq yas/my-directory "~/.emacs.d/vendor/scala-mode/contrib/yasnippet/snippets")
;; (yas/load-directory yas/my-directory)

 (add-hook 'scala-mode-hook
           '(lambda ()
              (yas/minor-mode-on)))

(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; MINI HOWTO: open .scala file. Ensure bin/server.sh is executable. M-x ensime

(global-set-key (kbd "C-x p") 'project-search-text)

;; overrride the normal file-opening, buffer switching
;;(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
;;(global-set-key (kbd "C-x b")   'lusty-buffer-explorer)

(display-time)

;; ECB
;;(setq ecb-tip-of-the-day nil)
;;(ecb-activate)
;;(setq ecb-tip-of-the-day nil)
;;;(ecb-hide-ecb-windows)

;; Fullscreen
(defun fullscreen ()
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen)
(global-set-key [f9] 'dictionary-search)

(add-to-list 'load-path "~/.emacs.d/vendor/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.xml.builder$" . ruby-mode))
(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode")
(require 'rspec-mode)

(global-set-key [f6] 'rspec-verify-single)

(require 'rvm)

;; (rvm-use-default) 
(rvm-use "ruby-1.9.1-p378" "default")
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; PHP Mode
(add-to-list 'load-path "~/.emacs.d/vendor/php-mode")
(require 'php-mode)

;; coffee-mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;Flymake PHP Extension
(require 'flymake) (unless (fboundp 'flymake-php-init) (defun flymake-php-init () (let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace)) (local-file (file-relative-name temp-file (file-name-directory buffer-file-name)))) (list "php" (list "-f" local-file "-l"))))) (let ((php-ext-re "\.php[345]?\'") (php-error-re "\(?:Parse\|Fatal\) error: \(.\) in \(.\) on line \([0-9]+\)")) (unless (assoc php-ext-re flymake-allowed-file-name-masks) (add-to-list 'flymake-allowed-file-name-masks (list php-ext-re 'flymake-php-init 'flymake-simple-cleanup 'flymake-get-real-file-name)) (add-to-list 'compilation-error-regexp-alist-alist (list 'compilation-php php-error-re 2 3 nil nil)) (add-to-list 'compilation-error-regexp-alist 'compilation-php) (add-to-list 'flymake-err-line-patterns (list php-error-re 2 3 nil 1)))) ;; add php flymake support (add-hook 'php-mode-hook (lambda () (flymake-mode t)))
(add-to-list 'auto-mode-alist '("\.php$" . flymake-mode))
