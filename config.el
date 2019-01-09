;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq display-line-numbers-type 'relative)

;; This will launch the editor maximized on the top left monitor
(run-at-time "0.1sec" nil
    (lambda ()
        (let ((fullscreen (frame-parameter (selected-frame) 'maximized)))
        (sleep-for 0.5)
        (modify-frame-parameters (selected-frame) '((top + -1057) (left + -1013)))
        (toggle-frame-maximized)
        )))
