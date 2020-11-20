#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias myscrot='scrot -s  ~/Pictures/Screenshots/%b%d_%H%M%S.png'
alias ls='ls --color=auto'
alias vgal='xrandr --output DP1 --left-of eDP1'
alias vgar='xrandr --output DP1 --right-of eDP1'
alias vga='xrandr --output DP1 --auto'

#Colors
alias ls='ls --color=auto'
export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
