[[ -r ~/.bashrc ]] && . ~/.bashrc

[[ $_OS_GNU_LINUX && $(tty) = '/dev/tty1' ]] || return

export GTK_THEME=Materia-dark-compact
export WLR_DRM_NO_ATOMIC=1
ck-launch-session sway
