if [[ -r ~/.profile ]]; then
	set -a; . ~/.profile; set +a
fi

[[ $- == *i* && -r ~/.bashrc ]] && . ~/.bashrc

[[ $_OS_GNU_LINUX && $(tty) = '/dev/tty1' ]] || return

export GTK_THEME=Materia-dark-compact
ck-launch-session dbus-launch --sh-syntax --exit-with-session sway
