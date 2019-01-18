# .doom.d

## About
This is my personal doom emacs config. Some of the config is for handling
MacOSX. Just comment those parts out if your on Linux. If your on Winblows...
May God have mercy on your soul. LOL! Just kidding, but seriously...

## Why
I like to keep my setup the same on various different systems running OSX and
Linux. This allows me to easily keep eveything the same. Doom Emacs is one hell
of a setup and doesn't really need too much config. I just wanted to a little to
assist with my daily workflow.

## Requirements
This requires a working install of Doom Emacs which can be found here: https://github.com/hlissner/doom-emacs

## Install
1. Backup your current `~/.doom.d/` directory if you have one.
2. Clone the repo to your home directory `git clone https://github.com/NirvanaDEV/.doom.d.git ~/`
3. Make tweaks to init.el, config.el, and packages.el as desired 
4. Run `make` in a terminal from within the `.emacs.d/` directory
5. Repeat #4 whenever you make changes to init.el or packages.el (maybe even
   config.el for good measure)

## Features
- Jump to windows with SPC and an arrow key (Cuz H-J-K-L is still a little weird
  to me, lol)
- Resize a window horizontally with (SPC -) and (SPC =)
- Resize a window vertically with (SPC _) and (SPC +)
- f5 will open up a file set to a register in the config. I use this for my
  daily org notes
- f6 kills all buffers (Cuz I'm crazy like that)
- On Mac I have a mult-monitor setup and I like to keep emacs open on my
  top-left screen. You can customize the positioning on line 14 and the width on
  line 17. The height is set to be full height of the screen.
- Integrated slack. For more details on adjusting the config and initial setup
  check out https://github.com/yuya373/emacs-slack . NOTE: The client id, secret
  and token have all been hidden for security reasons. Lines 59 through 77
  should be commented out during initial setup and then the id, secret and token
  replaced with your own.
