[[ -r ~/.bashrc ]] && . ~/.bashrc
[[ $_OS_GNU_LINUX && $(tty) = '/dev/tty1' ]] && startx -- vt1 &>/dev/null
