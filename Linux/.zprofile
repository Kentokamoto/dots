#File: .zprofile


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	case $WM in
		sway)
			exec sway
			;;
		gnome)
			#export QT_QPA_PLATFORM=wayland
			#XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
			exec startx
			;;
		i3)
			exec startx
			;;
		*) 
			exec sway
			exec fcitx
	esac
fi	
