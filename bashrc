include() {
	for f in "$@"; do
		[[ -r "$f" ]] && . "$f"
	done
}

include_first() {
    for f in "$@"; do
        [[ -r "$f" ]] && include "$f" && break
    done
}

include "$XDG_CONFIG_HOME"/theme.sh /usr/share/doc/pkgfile/command-not-found.bash
include_first /usr/{share,local/etc}/bash_completion

HISTFILE=$HOME/.cache/bash_history
HISTCONTROL=ignoreboth:erasedups HISTSIZE='' HISTFILESIZE=''
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

cd() {
  builtin cd "$@" && ls
}

mkcd() {
  builtin mkdir "$@" && builtin cd "${@: -1}" || return
}

yts() {
  mpv --no-video --load-unsafe-playlists --shuffle "ytdl://ytsearch30:$*"
}

shopt -s autocd nocaseglob globstar extglob histappend checkwinsize \
  cdable_vars

set -o vi
bind ':clear-screen'
bind ': history-substring-search-forward' ':history-substring-search-backward'
