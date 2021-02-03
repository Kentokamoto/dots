#Local Environmental Variables
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_QPA_PLATFORM=xcb
export GDK_backend=wayland
# Window Manger Options
# sway
# gnome
# i3
# kde
export WM=sway
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/Library/Python/3.8/bin
export PATH=$PATH:$HOME/go/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/Documents/Projects/fuchsia/.jiri_root/bin
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export SWAY_CURSOR_THEME=Adwaita

export QT_SELECT=5
source "$HOME/.cargo/env"
eval $(/opt/homebrew/bin/brew shellenv)