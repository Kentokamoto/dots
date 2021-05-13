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
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/homebrew/opt/luajit-openresty/bin
export PATH=$PATH:/opt/homebrew/opt/sqlite/bin
export PATH=$PATH:/opt/homebrew/opt/icu4c/bin
export PATH=$PATH:/opt/homebrew/opt/icu4c/sbin
export PATH=$PATH:/opt/homebrew/opt/qt/bin
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH=$PATH:$HOME/Library/Python/3.8/bin
export PATH=$PATH:$HOME/go/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/Documents/Development/Projects/OpenSource/fuchsia/.jiri_root/bin

# PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/opt/homebrew/lib/python3.9/site-packages/
# Guile
export GUILE_LOAD_PATH="/opt/homebrew/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/opt/homebrew/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/opt/homebrew/lib/guile/3.0/extensions"
# If you are going to use the Guile bindings you will need to add the following
# to your .bashrc or equivalent in order for Guile to find the TLS certificates
# database:
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
# Compiler Flags
# openblas
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openblas/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/openblas/lib/pkgconfig"
# readline
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/readline/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/readline/lib/pkgconfig"
# sqlite
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/sqlite/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/sqlite/lib/pkgconfig"
# tcl-tk
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/tcl-tk/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/tcl-tk/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/tcl-tk/lib/pkgconfig"
# libfi
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/libffi/lib/pkgconfig"
# icu4c
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/icu4c/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/icu4c/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/icu4c/lib/pkgconfig"
# qt
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/qt/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/qt/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /opt/homebrew/opt/qt/lib/pkgconfig"

source "$HOME/.cargo/env"

