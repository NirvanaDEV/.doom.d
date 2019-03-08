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
            ;; (when window-system (set-frame-position (selected-frame) -1080 -1190))
            (when window-system (set-frame-position (selected-frame) -1 23))
            (set-frame-width
                (selected-frame)
                    ;; 153)
                       273)
            (set-frame-height
                (selected-frame)
                (/ (display-pixel-height) (frame-char-height)))
            (set-frame-parameter (selected-frame) 'alpha 100)
            )))
       ))

;; Setup a register "d" to hold our DailyORG.org file
(set-register ?d (cons 'file "~/Documents/notebook/index.org"))


;; Create an ansi-term buffer with bash on load
(set-buffer (ansi-term "bash"))

;; Define a function for switching to the ansi-term buffer easily
(defun switch-to-ansi-term ()
  (interactive)
    (switch-to-buffer "*ansi-term*"))

;; Define a function to open the Google Chrome App (switches focus in OSX)
(defun shell-chrome ()
  (interactive)
  (shell-command "open -a \"Google Chrome.app\""))

;; Define a function to open the Outlook App (switches focus in OSX)
(defun shell-outlook ()
  (interactive)
  (shell-command "open -a \"Microsoft Outlook.app\""))

;; Define a function to open the Slack App (switches focus in OSX)
(defun shell-slack ()
  (interactive)
  (shell-command "open -a \"Slack.app\""))
;;
;; Define a function to open the Terminal App (switches focus in OSX)
(defun shell-terminal ()
  (interactive)
  (shell-command "open -a \"Terminal.app\""))

;; This binds f5 to open the file set to register "d" above. Also, we set f6
;; to kill all open buffers because I like keeping things tidy.
(map! (:map override
        "<M-f1>" #'switch-to-ansi-term ;; This binds the function to switch to terminal
        "<f5>" #'"C-x r j d" ;; This opens the file set in line 27 above
        "<f6>" #'doom/kill-all-buffers
        "<M-f6>" #'shell-chrome
        "<M-f7>" #'shell-outlook
        "<M-f8>" #'shell-slack
        "<M-S-f5>" #'shell-terminal))

;; Quicker window switching
(map! :leader
        :desc "Window Left"     "<left>"      #'evil-window-left
        :desc "Window Right"    "<right>"     #'evil-window-right
        :desc "Window Up"       "<up>"        #'evil-window-up
        :desc "window Down"     "<down>"      #'evil-window-down
        :desc "Window Up"       "k"           #'evil-window-up
        :desc "Window Down"     "j"           #'evil-window-down)

;; Quicker window sizing
(map! :leader
        :desc "Window Grow"     "+"           #'evil-window-increase-width
        :desc "Window Shrink"   "_"           #'evil-window-decrease-width
        :desc "Window vGrow"    "="           #'evil-window-increase-height
        :desc "Window vShrink"  "-"           #'evil-window-decrease-height)

;; This binds leader "R" to run the selected region as a shell command. This
;; was created to provide a custom way to interact with mpd audio but can be
;; used for many other things.
(map! :leader
      :desc "Shell Region"      "R"          #'shell-region)

;; This binds leader "r" to run the current line as a shell command. This
;; was created to provide a custom way to interact with mpd audio but can be
;; used for many other things.
(map! :leader
      :desc "Shell Line"      "r"          #'shell-line)

(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))

(defun shell-line ()
  "execute region in an inferior shell"
  (interactive)
  (shell-command  (thing-at-point 'line t)))

;; Use web-mode by default for these types of files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Some more types I use every day
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; Remember sessions and load the last when we restart emacs
(require 'session)
    (add-hook 'after-init-hook 'session-initialize)

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

;;; config.el ends here
