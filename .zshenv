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

if [[ ($(arch) == "arm64") ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# PATH extentions
export PATH=$PATH:/usr/local/bin
if [[ -d "$HOME/go/" ]]; then
    export PATH=$PATH:/usr/local/go/bin
fi
export PATH=$PATH:$HOME/.local/bin
if [[ -d "/Applications/Visual\ Studio\ Code.app/" ]]; then
    export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fi

# Compiler Flags
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

source "$HOME/.cargo/env"

if [[ $(uname -s) -eq "Darwin" ]];then
    #echo "macOS"

else

fi

