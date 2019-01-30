[[ -r ~/.profile ]] && . ~/.profile
[[ -r "$XDG_CONFIG_HOME"/theme.sh ]] && . "$XDG_CONFIG_HOME"/theme.sh

[[ -r /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
[[ -r /usr/share/doc/pkgfile/command-not-found.bash ]] && \
  . /usr/share/doc/pkgfile/command-not-found.bash

HISTFILE=$HOME/.cache/bash_history
HISTCONTROL=ignoreboth:erasedups HISTSIZE='' HISTFILESIZE=''
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

cd() {
  builtin cd "$@" && ls
}

mkcd() {
  builtin mkdir "$@" && builtin cd "${@: -1}" || return
}

yt() {
  mpv --ytdl-format='bestvideo[height>=?1080][height<=?1440]+bestaudio' "$@"
}

ytlow() {
  mpv --ytdl-format='bestvideo[height<=?480]+bestaudio' "$@"
}

yta() {
  mpv --no-video "$@"
}

ytp() {
  mpv --no-video --load-unsafe-playlists "https://youtube.com/playlist?list=$1"
}

yts() {
  mpv --no-video --load-unsafe-playlists --shuffle "ytdl://ytsearch30:$*"
}

shopt -s autocd nocaseglob globstar extglob histappend direxpand checkwinsize \
  cdable_vars

set -o vi
bind ':clear-screen'
bind ': history-substring-search-forward' ':history-substring-search-backward'
