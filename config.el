;;; ~/.doom.d/config.el --- lexical-binding: t; ---
;;; Commentary:

;;; Code:
;; Place your private configuration here
(setq-default display-line-numbers-type 'relative)

;; This will launch the editor maximized on the top left monitor
(run-at-time "0.1sec" nil
    (lambda ()
        (let ((fullscreen (frame-parameter (selected-frame) 'maximized)))
        (sleep-for 0.5)
        (modify-frame-parameters (selected-frame) '((top + -1057) (left + -1013)))
        (toggle-frame-maximized)
        )))

;; Quicker window switching
(map! :leader
        :desc "Window Left"     "<left>"      #'evil-window-left
        :desc "Window Right"    "<right>"     #'evil-window-right
        :desc "Window Up"       "<up>"        #'evil-window-up
        :desc "window Down"     "<down>"      #'evil-window-down)

;; Quicker window sizing
(map! :leader
        :desc "Window Grow"     "="           #'evil-window-increase-width
        :desc "Window Shrink"   "-"           #'evil-window-decrease-width)

;; Quickly open a terminal
(map! (:map override
        "<f5>" #'term
        "<f6>" #'doom/kill-all-buffers))

;;; config.el ends here
