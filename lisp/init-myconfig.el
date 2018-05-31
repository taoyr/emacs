;;---------------------my config----------------------------
(setq evil-want-C-u-scroll t)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(setq cscope-do-not-update-database t)

(evil-commentary-mode)

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require 'xcscope)
(evil-leader/set-key
  "b" 'helm-buffers-list
  "c" 'cscope-find-functions-calling-this-function
  "d" 'cscope-find-global-definition
  "l" 'helm-locate
  "m" 'helm-imenu
  "o" 'helm-occur
  "p" 'find-file-in-project
  "s" 'cscope-find-this-symbol
  "t" 'cscope-find-this-text-string
  "w" 'save-buffer)

(require 'git-gutter)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq c-default-style "Linux")
(setq default-tab-width 4)

(define-key global-map (kbd "C-j") 'save-buffer)
(define-key global-map (kbd "<f3>") 'switch-window)
(define-key global-map (kbd "<f4>") 'delete-other-windows)
(define-key global-map (kbd "<f5>") 'delete-window)
(define-key global-map (kbd "<f8>") 'helm-do-grep-ag)

(add-hook 'after-init-hook 'global-hl-line-mode)

;; (require 'molokai-theme)

;; (set-face-foreground 'highlight "FFFFFF")
;; (set-face-background 'highlight "cyan")
;; (set-face-foreground 'region "red")
;; (set-face-background 'region "cyan")
;; (set-face-foreground 'secondary-selection "red")
;; (set-face-background 'secondary-selection "cyan")

(define-key evil-normal-state-map (kbd "C-n") 'cscope-history-forward-line)
(define-key evil-normal-state-map (kbd "C-p") 'cscope-history-backward-line)
(define-key evil-normal-state-map (kbd "RET") 'cscope-select-entry-other-window)
(define-key evil-normal-state-map (kbd "C-]") 'cscope-find-global-definition-no-prompting)
(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)
(define-key evil-visual-state-map (kbd "L") 'evil-end-of-visual-line)

(add-hook 'java-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(require 'powerline)
(powerline-center-evil-theme)


;; (load-theme 'monokai t)

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;-------------------my config-------------------------------------------------

(provide 'init-myconfig)
