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

# Compiler Flags
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Other Env Variables
export PAGER="less -S -X"
source "$HOME/.cargo/env"

# Java
export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'
export PATH=$JAVA_HOME/bin:$PATH 
