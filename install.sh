#!/usr/bin/env bash

C=~/.config
. "$C/profile"

makedirs=(
	"$HOME/.local"
	"$HOME/.cache"
)

homedot=(
	ackrc
	bash_profile
	bashrc
	editrc
	inputrc
	profile
)

packages=(
	bash
	bash-completion
	coreutils
	neovim
	rsync
	tree
)

if [[ -z $_SERVER ]]; then
	homedot+=(
		lldbinit
		tmux.conf
	)
	packages+=(
		mpv
		youtube-dl
	)
fi

if [[ $_OS_GNU_LINUX && -z $_SERVER ]]; then
	homedot+=(
		Xresources
		xinit
	)
	packages+=(
		mpv
		youtube-dl
	)
fi

if [[ $_OS_MACOS ]]; then
	packages+=(
		findutils
		gnu-sed
		rename
		watch
	)

	if [[ -z $_SERVER ]]; then
		homedot+=(
			chunkwmrc
			skhdrc
		)
		packages+=(
			chunkwm
			osxfuse
			skhd
		)
	fi
fi

# execute

echo "Making directories ${makedirs[*]}"
for dir in "${makedirs[@]}"; do
	mkdir -p "$dir"
done

linkHome() {
	echo "Linking to home directory: $*"
	for file in "$@"; do
		ln -s "$C/$file" "$HOME/.$file"
	done
}

link() {
	echo "Linking '$2' to '$1'"
	ln -s "$1" "$2"
}

private() {
	echo "Installing private data: $*"
	for path in "$@"; do
		ln -s "$C/private/$path" "$C/$path"
	done
}

linkHome "${homedot[@]}"
link "../.config/bin" "$HOME/.local/bin"

if [[ $_USE_PERSONAL ]]; then
	private
		pass \
		transmission-daemon \
		gpg \
		offlineimap \
		mutt/public \
		newsboat/urls \
		task/ca.cert.pem \
		task/user.cert.pem \
		task/user.key.pem
fi

if [[ $_OS_ARCH_LINUX ]]; then
	INSTALL='sudo pacman -Syy --needed'

elif [[ $_OS_MACOS ]]; then
	INSTALL='brew install'

	cp "$C"/UK.keylayout "$HOME/Library/Keyboard Layouts/UK.keylayout"

	git clone https://github.com/Shougo/dein.vim \
		"$DEIN_DIR"/repos/github.com/Shougo/dein.vim

	if ! command -v brew; then
		/usr/bin/ruby -e \
			"$(curl -fsSL \
				https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew ln bash
	brew tap crisidev/homebrew-chunkwm
	brew service start chunkwm skhd
	brew tap jlhonora/lsusb osxfuse/osxfuse
	brew install --HEAD ifuse ideviceinstaller
fi

if [ -z "$INSTALL" ]; then
	>&2 echo "No installation command set for this operating system"
fi

echo "Installing: ${packages[*]}"
"${INSTALL[*]}" "${packages[@]}"
