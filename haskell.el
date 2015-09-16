;;; haskell.el

;;; Code:

(prelude-require-package 'hi2)
(add-hook 'haskell-mode-hook 'turn-on-hi2)

;;(add-hook 'after-init-hook #'global-flycheck-mode)

(prelude-require-package 'flycheck-haskell)
;;(add-hook 'haskell-mode-hook 'flycheck-mode)
;;(eval-after-load 'flycheck 
;;                (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))


(defun haskell/init-flycheck ()
    (add-hook 'haskell-mode-hook 'flycheck-mode)
      )

(defun haskell/init-flycheck-haskell ()
     (add-hook 'flycheck-mode-hook 'flycheck-haskell-setup)
        )

(prelude-require-package 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)



(custom-set-variables
  '(haskell-process-type 'cabal-repl)
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))


(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))



;;; haskell.el ends here
