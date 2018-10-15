#!/usr/bin/env bash

private() {
	for path in "$@"; do
		ln -s "$C/private/$path" "$C/$path"
	done
}

C=~/.config
. "$C/profile"

homedot=(
  profile bash_profile bashrc editrc lldbinit ackrc tmux.conf
)

if [[ $_OS_GNU_LINUX ]]; then
	homedot+=(xinit Xresources)
fi

packages=(bash bash-completion coreutils rsync neovim mpv youtube-dl)

if [[ $_OS_MACOS ]]; then
	packages+=(findutils rename gnu-sed watch chunkwm skhd osxfuse)
fi

for file in "${homedot[@]}"; do
  ln -s "$C/$file" "$HOME/.$file"
done

private pass transmission-daemon gpg offlineimap mutt/public newsboat/urls

if [[ $_OS_ARCH_LINUX ]]; then
	INSTALL='pacman -S'
elif [[ $_OS_MACOS ]]; then
	if ! command -v brew; then
		/usr/bin/ruby -e \
			"$(curl -fsSL \
				https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	INSTALL='brew install'

	brew tap crisidev/homebrew-chunkwm
	brew tap jlhonora/lsusb osxfuse/osxfuse
	brew install --HEAD ifuse ideviceinstaller
	brew ln bash
	brew service start chunkwm skhd
fi

echo "Installing ${packages[*]}"
sudo $INSTALL "${packages[@]}"
