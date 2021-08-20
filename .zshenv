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

if [[ $(command -v brew &>/dev/null) -eq 0 ]]; then
    eval $(brew shellenv)
fi

#if [[ ($(arch) == "arm64") ]]; then
#    eval $(/opt/homebrew/bin/brew shellenv)
#else
#    eval $(/usr/local/Homebrew/bin/brew shellenv)
#fi

# PATH extentions
export PATH=$PATH:/usr/local/bin
if [[ -d "$HOME/go/" ]]; then
    export PATH=$PATH:/usr/local/go/bin
fi
export PATH=$PATH:$HOME/.local/bin
if [[ -d "/Applications/Visual\ Studio\ Code.app/" ]]; then
    export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fi

# Guile
export GUILE_LOAD_PATH="/opt/homebrew/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/opt/homebrew/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/opt/homebrew/lib/guile/3.0/extensions"
# If you are going to use the Guile bindings you will need to add the following
# to your .bashrc or equivalent in order for Guile to find the TLS certificates
# database:
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

# Compiler Flags
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

source "$HOME/.cargo/env"

if [[ $(uname -s) -eq "Darwin" ]];then
    #echo "macOS"

else

fi

