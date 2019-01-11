;;; ~/.doom.d/config.el --- lexical-binding: t; ---
;;; Commentary:

;;; Code:
;; Place your private configuration here
(setq-default display-line-numbers-type 'relative)

;; This will launch the editor maximized on the top left monitor of my MacOSX setup
(cond ((eq system-type 'darwin)

    (run-at-time "0.1sec" nil
        (lambda ()
            (let ((fullscreen (frame-parameter (selected-frame) 'maximized)))
            (sleep-for 0.5)
            (when window-system (set-frame-position (selected-frame) -1122 -1057))
            (set-frame-width
                (selected-frame)
                    193)
            (set-frame-height
                (selected-frame)
                (/ (display-pixel-height) (frame-char-height)))
            )))

       ))

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

;; Quickly open a terminal
(map! (:map override
        "<f5>" #'term
        "<f6>" #'doom/kill-all-buffers))

;;; config.el ends here
