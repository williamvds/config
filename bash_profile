if [[ -r ~/.profile ]]; then
	set -a; . ~/.profile; set +a
fi

[[ $- == *i* && -r ~/.bashrc ]] && . ~/.bashrc

[[ $_OS_GNU_LINUX && $(tty) = '/dev/tty1' ]] || return

GTK_THEME=Materia-dark-compact WLR_DRM_NO_ATOMIC=1 sway
