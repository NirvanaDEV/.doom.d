;;; ~/.doom.d/config.el --- lexical-binding: t; ---
;;; Commentary: My very own doom emacs config

;;; Code:
;; Place your private configuration here

(setq-default display-line-numbers-type 'relative)

;; This will launch the editor sized, positioned and styled on my MacOSX setup
(cond ((eq system-type 'darwin)
    ;; Wait a split second before adjusting the frame
    (run-at-time "0.1sec" nil
        (lambda ()
            (let ((fullscreen (frame-parameter (selected-frame) 'maximized)))
            (when window-system (set-frame-position (selected-frame) -1120 -1057))
            (set-frame-width
                (selected-frame)
                    272)
            (set-frame-height
                (selected-frame)
                (/ (display-pixel-height) (frame-char-height)))
            (set-frame-parameter (selected-frame) 'alpha 90)
            )))
       ))

;; Setup a register "d" to hold our DailyORG.org file
(set-register ?d (cons 'file "~/Documents/DailyORG.org"))

;; This binds f5 to open the file set to register "d" above. Also, we set f6
;; to kill all open buffers because I like keeping things tidy.
(map! (:map override
        "<f5>" #'"C-x r j d" ;; This opens the file set in line 27 above
        "<f6>" #'doom/kill-all-buffers))

;; Quicker window switching
(map! :leader
        :desc "Window Left"     "<left>"      #'evil-window-left
        :desc "Window Right"    "<right>"     #'evil-window-right
        :desc "Window Up"       "<up>"        #'evil-window-up
        :desc "window Down"     "<down>"      #'evil-window-down)

;; Quicker window sizing
(map! :leader
        :desc "Window Grow"     "="           #'evil-window-increase-width
        :desc "Window Shrink"   "-"           #'evil-window-decrease-width
        :desc "Window vGrow"    "+"           #'evil-window-increase-height
        :desc "Window vShrink"  "_"           #'evil-window-decrease-height)

;; This binds leader "r" to run the selected region as a shell command. This
;; was created to provide a custom way to interact with mpd audio but can be
;; used for many other things.
(map! :leader
      :desc "Shell Region"      "r"          #'shell-region)

(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))

;; Use web-mode by default for these types of files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Remember sessions and load the last when we restart emacs
(require 'session)
    (add-hook 'after-init-hook 'session-initialize)

;;; config.el ends here
