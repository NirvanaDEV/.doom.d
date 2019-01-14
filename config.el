;;; ~/.doom.d/config.el --- lexical-binding: t; ---
;;; Commentary:

;;; Code:
;; Place your private configuration here
(setq-default display-line-numbers-type 'relative)

;; This will launch the editor sized, positioned and styled on my MacOSX setup
(cond ((eq system-type 'darwin)
    ;; Wait a split second before adjusting the frame
    (run-at-time "0.1sec" nil
        (lambda ()
            (let ((fullscreen (frame-parameter (selected-frame) 'maximized)))
            (when window-system (set-frame-position (selected-frame) -1122 -1057))
            (set-frame-width
                (selected-frame)
                    193)
            (set-frame-height
                (selected-frame)
                (/ (display-pixel-height) (frame-char-height)))
            (set-frame-parameter (selected-frame) 'alpha 95)
            )))

       ))

;; Setup a register "d" to hold our DailyORG.org file
(set-register ?d (cons 'file "~/Documents/DailyORG.org"))

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
        "<f5>" #'"C-x r j d" ;; This opens the file set in line 27 above
        "<f6>" #'doom/kill-all-buffers))

;; This binds leader "r" to run the selected region as a shell command. This
;; was created to provide a custom way to interact with mpd audio but can be
;; used for many other things.
(map! :leader
      :desc "Shell Region"      "r"          #'shell-region)

(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))

;;; config.el ends here
