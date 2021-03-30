_release=$(uname -r)
[ "$(uname -o 2>/dev/null)" = 'GNU/Linux' ]	&& export _OS_GNU_LINUX=1
[ "${_release#*arch}" != 'arch' ]			&& export _OS_ARCH_LINUX=1
[ "$(uname)" = 'Darwin' ]					&& export _OS_MACOS=1

CONFIG="$HOME"/.config

export XDG_CONFIG_HOME="$CONFIG"
export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/saved"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_PUBLICSHARE_DIR="$HOME/public"
export XDG_TEMPLATES_DIR="$HOME/.config/templates"
export XDG_VIDEOS_DIR="$HOME/vids"

[ -r "$CONFIG/local" ] && . "$CONFIG/local"

export ANDROID_TOOLS=/opt/android-sdk
export CTEST_OUTPUT_ON_FAILURE=1
export DEIN_DIR="$HOME/.local/share/nvim/dein"
export GNUPGHOME=$XDG_CONFIG_HOME/gpg
export GOPATH="$HOME/.cache/go"
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
export ICEAUTHORITY=$XDG_CONFIG_HOME/ICEauthority
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export LESSKEY=$XDG_CONFIG_HOME/less/keys
export MAILDIR=$HOME/.local/mail
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch
export PASSWORD_STORE_DIR=$HOME/docs/pass
export PASSWORD_STORE_GENERATED_LENGTH=100
export PSQL_HISTORY="$HOME/.cache/psql_history"
export PYLINTHOME="$HOME/.cache/pylint"
export PYLINTRC="$XDG_CONFIG_HOME/pylintrc"
export STACK_ROOT="$HOME/.local/share/stack"
export SUBVERSION_HOME="$XDG_CONFIG_HOME/subversion"
export TASKDATA="$XDG_CONFIG_HOME/task"
export TASKRC=$TASKDATA/config
export WINEPATH="$HOME/.local/bin"
export WINEPREFIX="$HOME/.local/share/wine"
export XDG_CONFIG_HOME="$CONFIG"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.xrender=true"

if [ $_OS_GNU_LINUX ] && [ -n "$XDG_RUNTIME_DIR" ]; then
	SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
	export SSH_AUTH_SOCK
fi

if [ -n "$WAYLAND_DISPLAY" ]; then
	export CLUTTER_BACKEND=wayland
	export MOZ_ENABLE_WAYLAND=1
	export SDL_VIDEODRIVER=wayland
	export QT_WAYLAND_FORCE_DPI=physical
fi

export PATH="$HOME/.local/bin:$PATH:$ANDROID_TOOLS/tools/bin/"

if [ $_OS_MACOS ]; then
export PATH="\
/usr/local/opt/findutils/libexec/gnubin\
:/usr/local/opt/gnu-sed/libexec/gnubin\
:/usr/local/opt/coreutils/libexec/gnubin\
:/usr/local/sbin\
:/usr/local/bin\
:$HOME/.local/bin\
:$PATH\
"

export MANPATH="\
/usr/local/opt/coreutils/libexec/gnuman\
:$MANPATH\
"
fi

for editor in nvim vim vi; do
	if command -v $editor >/dev/null; then
		export EDITOR=$editor
		break;
	fi
done

export editor=$EDITOR
export VISUAL=$EDITOR
export TERMINAL=alacritty
export BROWSER=firefox
export MANPAGER="$EDITOR -c 'set ft=man nonu nomod nolist' -"

export CLASSPATH="class:src:bin/*:lib/*:/usr/share/java/*:$ANDROID_TOOLS/platforms/android-27/android.jar"

if command -v systemctl >/dev/null; then
	systemctl --user import-environment \
		PATH \
		SSH_AUTH_SOCK \
		GNUPGHOME \
		PASSWORD_STORE_DIR
fi

alias 2..='../..'
alias 3..='../../..'
alias 4..='../../../..'
alias 5..='../../../../..'

if [ $_OS_GNU_LINUX ]; then
	alias sys='systemctl'
	alias sysu='systemctl --user'
	complete -F _complete_alias sys
	complete -F _complete_alias sysu

	alias reboot='systemctl reboot'
	alias shutdown='systemctl poweroff'
	alias hibernate='systemctl hibernate'
	alias suspend='systemctl suspend-then-hibernate'
fi

if [ $_OS_ARCH_LINUX ]; then
	alias p='yay'
	alias P='sudo pacman'
	alias update='yay -Qqet |grep -- -git |xargs yay --needed --noconfirm -Syyu'
	alias orphans='yay -Rnsd $(yay -Qtdq)'
	alias mirrorlist='curl https://www.archlinux.org/mirrorlist/?country=AU\&country=BE\&country=CZ\&country=DK\&country=FI\&country=FR\&country=DE\&country=IE\&country=IT\&country=LU\&country=NL\&country=NO\&country=ES\&country=SE\&country=CH\&country=GB\&protocol=https\&ip_version=4\&ip_version=6 |sudo tee /etc/pacman.d/mirrorlist.tmp >/dev/null && sudo sed -i "s/^#Server/Server/" /etc/pacman.d/mirrorlist.tmp && sudo rankmirrors -n 12 /etc/pacman.d/mirrorlist.tmp |sudo tee /etc/pacman.d/mirrorlist'
fi

if [ $_OS_MACOS ]; then
	alias suspend='\sudo /sbin/shutdown -s now'
	alias shutdown='\sudo /sbin/shutdown -h now'
fi

alias rss='newsboat'
alias mail='aerc'
alias hl='ag --passthrough'
alias totp='oathtool --totp -b'

alias rsync='rsync -h --info=progress2'
alias df='df -h'
alias lsblk='lsblk -o name,label,size,mountpoint'
alias find='find -L'
alias ls='ls -Lh --color=auto --group-directories-first'
alias l='ls'
alias ll='ls -l'
alias L='l -A'
alias LL='L -A'
alias mkdir='mkdir -pv'
alias p='pwd'
alias rm='rm -I'
alias rF='rm -rf'
alias rr='rm -rI'
alias sudo='sudo -E '
alias tree='tree -C'
alias t='tree'
alias vi='$EDITOR'
alias vim='$EDITOR'
alias watch='watch -c '

alias ytlow='mpv --ytdl-format="bestvideo[height<=?480]+bestaudio"'
alias yta='mpv --no-video'
alias play-yt='yt "$(pbpaste)"'

if [ $_OS_MACOS ]; then
	alias python='python3'
	alias pip='pip3'
fi

alias g='git'
alias G='git status -s'
alias gitls='git ls-tree --name-only HEAD'
alias gittree='git ls-tree --name-only HEAD -r'
alias gitrev='git svn find-rev'

alias s='svn'
alias S='svn status'
alias sclean="xargs -d '\\n' -a <(s --ignore-externals | \
	awk '/^?/ {print substr(\$0, 9)}') rm -r"
alias stree='svn ls --depth=infinity'
# vim: ft=sh
