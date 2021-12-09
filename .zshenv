#Local Environmental Variables
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_QPA_PLATFORM=xcb
export GDK_backend=wayland
export QT_SELECT=5
# Window Manger Options
# sway
# gnome
# i3
# kde
export WM=sway
export SWAY_CURSOR_THEME=Adwaita

# PATH extentions
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Compiler Flags
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

source "$HOME/.cargo/env"
