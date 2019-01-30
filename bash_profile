[[ -r ~/.bashrc ]] && . ~/.bashrc

[[ $_OS_GNU_LINUX && $(tty) = '/dev/tty1' ]] || return

WLR_DRM_NO_ATOMIC=1 ck-launch-session dbus-launch --sh-syntax --exit-with-session sway
