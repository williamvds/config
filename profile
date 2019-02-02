[[ $(uname -o 2>/dev/null) == 'GNU/Linux' ]] && export _OS_GNU_LINUX=1
[[ $(uname -r) =~ ARCH$ ]]									 && export _OS_ARCH_LINUX=1
[[ $(uname) == 'Darwin' ]]									 && export _OS_MACOS=1

CONFIG="$HOME"/.config

[[ -r "$CONFIG/local" ]] && . "$CONFIG/local"

export XDG_CONFIG_HOME="$CONFIG"
export ANDROID_TOOLS=/opt/android-sdk
export MAILDIR=$HOME/.local/mail
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch
export GNUPGHOME=$XDG_CONFIG_HOME/gpg
export ICEAUTHORITY=$XDG_CONFIG_HOME/ICEauthority
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export LESSKEY=$XDG_CONFIG_HOME/less/keys
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
export PYLINTRC=$XDG_CONFIG_HOME/pylintrc
export TASKDATA=$XDG_CONFIG_HOME/task
export TASKRC=$TASKDATA/config
export PASSWORD_STORE_DIR=$XDG_CONFIG_HOME/pass
export PASSWORD_STORE_GENERATED_LENGTH=100
export MOZ_USE_XINPUT2=1
export DEIN_DIR=$HOME/.local/share/nvim/dein

if [[ $_OS_GNU_LINUX && -n $XDG_RUNTIME_DIR ]]; then
	SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
	export SSH_AUTH_SOCK

	if command -v sway &>/dev/null; then
		SWAYSOCK=$(find "$XDG_RUNTIME_DIR" -name 'sway-*.sock' |head -n 1)
		export SWAYSOCK
	fi
fi

export PATH=~/.local/bin:$PATH:$ANDROID_TOOLS/tools/bin/

for editor in nvim vim vi; do
	if command -v $editor &>/dev/null; then
		export EDITOR=$editor
		break;
	fi
done

export editor=$EDITOR
export VISUAL=$EDITOR
export TERMINAL=alacritty
export BROWSER=firefox-nightly
export MANPAGER="$EDITOR -c 'set ft=man nonu nomod nolist' -"

export CLASSPATH="class:src:bin/*:lib/*:/usr/share/java/*:$ANDROID_TOOLS/platforms/android-27/android.jar"
export CFLAGS='-std=c11'
export CPPFLAGS='-Wall -g -shared'
export CXXFLAGS='-std=c++17'

alias 2..='../..'
alias 3..='../../..'
alias 4..='../../../..'
alias 5..='../../../../..'

if [[ $_OS_GNU_LINUX ]]; then
	alias open='mimeo'

	if command -v openrc &>/dev/null; then
		alias reboot='\sudo openrc-shutdown -r'
		alias shutdown='\sudo openrc-shutdown -p'
		alias hibernate='\sudo pm-hibernate'
		alias suspend='\sudo pm-suspend'
	else
		alias reboot='\sudo systemctl restart'
		alias shutdown='\sudo systemctl shutdown'
		alias hibernate='\sudo systemctl hibernate'
		alias suspend='\sudo systemctl suspend'
	fi
fi

if [[ $_OS_ARCH_LINUX ]]; then
	alias p='pacaur'
	alias P='sudo pacman'
	alias update='pacaur -Qqet |grep -- -git |xargs pacaur --needed --noconfirm -Syyu'
	alias orphans='pacaur -Rnsd $(pacaur -Qtdq)'
	alias mirrorlist='curl https://www.archlinux.org/mirrorlist/?country=AU\&country=BE\&country=CZ\&country=DK\&country=FI\&country=FR\&country=DE\&country=IE\&country=IT\&country=LU\&country=NL\&country=NO\&country=ES\&country=SE\&country=CH\&country=GB\&protocol=https\&ip_version=4\&ip_version=6 |sudo tee /etc/pacman.d/mirrorlist.tmp >/dev/null && sudo sed -i "s/^#Server/Server/" /etc/pacman.d/mirrorlist.tmp && sudo rankmirrors -n 12 /etc/pacman.d/mirrorlist.tmp |sudo tee /etc/pacman.d/mirrorlist'
fi

if [[ $_OS_MACOS ]]; then
	alias suspend='\sudo /sbin/shutdown -s now'
	alias shutdown='\sudo /sbin/shutdown -h now'
fi

alias rss='newsboat'
alias mail='neomutt'
alias hl='ack --passthru'
alias totp='oathtool --totp -b'

alias df='df -h'
alias lsblk='lsblk -o name,label,size,mountpoint'
alias find='find -L'
alias ls='ls -h --color=auto --group-directories-first'
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

if [[ $_OS_MACOS ]]; then
	alias python='python3'
	alias pip='pip3'
fi

alias g='git'
alias G='git status'
alias gitls='git ls-tree --name-only HEAD'
alias gittree='git ls-tree --name-only HEAD -r'

alias s='svn'
alias S='svn status'
alias sclean="xargs -d '\\n' -a <(s --ignore-externals | \
	awk '/^?/ {print substr(\$0, 9)}') rm -r"
alias stree='svn ls --depth=infinity'
