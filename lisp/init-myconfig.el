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
  "f" 'helm-locate
  "s" 'cscope-find-this-symbol
  "c" 'cscope-find-functions-calling-this-function
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

(define-key global-map (kbd "C-j") 'sanityinc/toggle-delete-other-windows)
(define-key global-map (kbd "C-k") 'kill-buffer-and-window)
(define-key global-map (kbd "C-l") 'switch-window)

(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

(define-key evil-normal-state-map (kbd "C-n") 'cscope-history-forward-line)
(define-key evil-normal-state-map (kbd "C-p") 'cscope-history-backward-line)
(define-key evil-normal-state-map (kbd "RET") 'cscope-select-entry-other-window)
(define-key evil-normal-state-map (kbd "C-]") 'cscope-find-global-definition-no-prompting)
;;-------------------my config-------------------------------------------------

(provide 'init-myconfig)
