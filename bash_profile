if [[ -r ~/.profile ]]; then
	set -a; . ~/.profile; set +a
fi

[[ $- == *i* && -r ~/.bashrc ]] && . ~/.bashrc

if [[ -z $TMUX ]] && [[ -n $SSH_CONNECTION ]]; then
	tmux new -A -s main
fi

if [[ $_OS_GNU_LINUX && $(tty) = '/dev/tty1' ]]; then
	GTK_THEME=Materia-dark-compact sway
fi
