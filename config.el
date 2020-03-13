;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Keith Williams"
      user-mail-address "keeftek@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

;; Org mode separator lines
(setq org-cycle-separator-lines 1)

;; Set todoist token
(setq todoist-token "86861094e80196aad35796a68caee04da47b1427")

;; Launch todoist buffer via function
(defun todoist-list ()
  (interactive)
  (let (($buf (generate-new-buffer "todos")))
    (switch-to-buffer $buf)
    (funcall todoist)
    (setq buffer-offer-save t)
    $buf
    ))

(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

It returns the buffer (for elisp programing).

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2017-11-01"
  (interactive)
  (let (($buf (generate-new-buffer "todos")))
    (switch-to-buffer $buf)
    (funcall "todoist")
    (setq buffer-offer-save t)
    $buf
    ))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CARRIED OVER FROM MY OLD CONFIG FROM 2018
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This will launch the editor sized, positioned and styled on my MacOSX setup
;; "Eval (frame-parameters)" - will display current frames details
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
                       238)
            (set-frame-height
                (selected-frame)
                (/ (display-pixel-height) (frame-char-height)))
            (set-frame-parameter (selected-frame) 'alpha 100)
            (evil-window-vsplit nil nil)
            (+evil/window-move-right)
            (+vterm/here nil)
            (evil-window-left 1)
            )))
       ))

(customize-set-variable 'tramp-save-ad-hoc-proxies t)
;;
;; ;; Setup a register "d" to hold our DailyORG.org file
;; (set-register ?d (cons 'file "~/Documents/notebook/index.org"))
;;
;;
;; ;; Create an ansi-term buffer with bash on load
;; (set-buffer (ansi-term "bash"))
;;
;; ;; Define a function for switching to the ansi-term buffer easily
;; (defun switch-to-ansi-term ()
;;   (interactive)
;;     (switch-to-buffer "*ansi-term*"))
;;
;; ;; Define a function to open the Google Chrome App (switches focus in OSX)
;; (defun shell-chrome ()
;;   (interactive)
;;   (shell-command "open -a \"Google Chrome.app\""))
;;
;; ;; Define a function to open the Outlook App (switches focus in OSX)
;; (defun shell-outlook ()
;;   (interactive)
;;   (shell-command "open -a \"Microsoft Outlook.app\""))
;;
;; ;; Define a function to open the Slack App (switches focus in OSX)
;; (defun shell-slack ()
;;   (interactive)
;;   (shell-command "open -a \"Slack.app\""))
;; ;;
;; ;; Define a function to open the Terminal App (switches focus in OSX)
;; (defun shell-terminal ()
;;   (interactive)
;;   (shell-command "open -a \"Terminal.app\""))
;;
;; ;; This binds f5 to open the file set to register "d" above. Also, we set f6
;; ;; to kill all open buffers because I like keeping things tidy.
;; (map! (:map override
;;         "<M-f1>" #'switch-to-ansi-term ;; This binds the function to switch to terminal
;;         "<f5>" #'"C-x r j d" ;; This opens the file set in line 27 above
;;         "<f6>" #'doom/kill-all-buffers
;;         "<M-f6>" #'shell-chrome
;;         "<M-f7>" #'shell-outlook
;;         "<M-f8>" #'shell-slack
;;         "<M-S-f5>" #'shell-terminal))
;;
;; Custom Keybindings
(map! :leader
      :desc "Jump to previous position in ring"  "k" #'org-mark-ring-goto
      :desc "Switch buffers" "j" #'switch-to-buffer
      :desc "Launch a vterm" "v" #'+vterm/here nil)

;; ;; Quicker window switching
;; (map! :leader
;;         :desc "Window Left"     "<left>"      #'evil-window-left
;;         :desc "Window Right"    "<right>"     #'evil-window-right
;;         :desc "Window Up"       "<up>"        #'evil-window-up
;;         :desc "window Down"     "<down>"      #'evil-window-down
;;         :desc "Window Up"       "k"           #'evil-window-up
;;         :desc "Window Down"     "j"           #'evil-window-down)
;;
;; ;; Quicker window sizing
;; (map! :leader
;;         :desc "Window Grow"     "+"           #'evil-window-increase-width
;;         :desc "Window Shrink"   "_"           #'evil-window-decrease-width
;;         :desc "Window vGrow"    "="           #'evil-window-increase-height
;;         :desc "Window vShrink"  "-"           #'evil-window-decrease-height)
;;
;; ;; This binds leader "R" to run the selected region as a shell command. This
;; ;; was created to provide a custom way to interact with mpd audio but can be
;; ;; used for many other things.
;; (map! :leader
;;       :desc "Shell Region"      "R"          #'shell-region)
;;
;; ;; This binds leader "r" to run the current line as a shell command. This
;; ;; was created to provide a custom way to interact with mpd audio but can be
;; ;; used for many other things.
;; (map! :leader
;;       :desc "Shell Line"      "r"          #'shell-line)
;;
;; (defun shell-region (start end)
;;   "execute region in an inferior shell"
;;   (interactive "r")
;;   (shell-command  (buffer-substring-no-properties start end)))
;;
;; (defun shell-line ()
;;   "execute region in an inferior shell"
;;   (interactive)
;;   (shell-command  (thing-at-point 'line t)))
