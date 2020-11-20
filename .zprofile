#File: .zprofile

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	case $WM in
		sway)
			exec sway
			;;
		gnome)
			if [[ -z $MY_GS_WATCHDOG ]]; then
				MY_GS_WATCHDOG=1 XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
			fi	
			export XDG_CONFIG_HOME="$HOME/.config"
			#if [[-z $XDG_SESSION_TYPE ]] then 
			#export QT_QPA_PLATFORM=wayland
			#export XDG_SESSION_TYPE=wayland 
			#exec gnome-session
			#fi
			#exec startx -- -keeptty -nolisten tcp > ~/.xorg.log 2>&1
			#exec startx
			;;
		i3)
			exec startx -- -nolisten tcp > ~/.xorg.log 2>&1
			;;
		*) 
			exec sway
			exec fcitx
	esac
fi	

export PATH="$HOME/.cargo/bin:$PATH"
