case $WM in 
i3)
	exec i3
	exec sh ~/Documents/wallpaper.sh
	;;
budgie)
	export XDG_CURRENT_DESKTOP=Budgie:GNOME
	exec budgie-desktop
	;;
gnome)
	export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
	export GNOME_SHELL_SESSION_MODE=classic
	exec gnome-session --session=gnome-classic
	;;
*)
	exec i3
	exec sh ~/Documents/wallpaper.sh
esac

#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx
