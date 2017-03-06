#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
# WM choices
# budgie
# i3
# gnome
export WM=i3
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
