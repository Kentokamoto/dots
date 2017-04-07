case $WM in 
	gnome) 
		export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
		export GNOME_SHELL_SESSION_MODE=classic
		exec gnome-session --session=gnome-classic
		;;
	i3)
		xrandr --dpi 96
		exec i3		
		;;
	*)
		export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
		export GNOME_SHELL_SESSION_MODE=classic
		exec gnome-session --session=gnome-classic
esac
