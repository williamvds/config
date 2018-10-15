dbus-update-activation-environment DISPLAY
export eval $(gnome-keyring-daemon -sc pkcs11,secrets)
eval $(gpg-agent --daemon --enable-ssh-support --sh)
start-pulseaudio-x11

ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
