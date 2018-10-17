#!/usr/bin/env bash

DEFAULT_USER=$(whoami)
PROMPT_DIRTRIM=2
CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

text_effect() {
  case "$1" in
    reset)      echo 0;;
    bold)       echo 1;;
    underline)  echo 4;;
  esac
}

fg_color() {
  case "$1" in
    black)      echo 30;;
    red)        echo 31;;
    green)      echo 32;;
    yellow)     echo 33;;
    blue)       echo 34;;
    magenta)    echo 35;;
    cyan)       echo 36;;
    white)      echo 37;;
    orange)     echo 38\;5\;166;;
  esac
}

bg_color() {
  case "$1" in
    black)      echo 40;;
    red)        echo 41;;
    green)      echo 42;;
    yellow)     echo 43;;
    blue)       echo 44;;
    magenta)    echo 45;;
    cyan)       echo 46;;
    white)      echo 47;;
    orange)     echo 48\;5\;166;;
  esac;
}

ansi() {
  local seq
  declare -a mycodes=("${!1}")

  seq=""
  for ((i = 0; i < ${#mycodes[@]}; i++)); do
    if [[ -n $seq ]]; then
      seq="${seq};"
    fi
    seq="${seq}${mycodes[$i]}"
  done
  echo -ne '\[\033['"${seq}"'m\]'
}

ansi_single() {
  echo -ne '\[\033['"$1"'m\]'
}

prompt_segment() {
  local bg fg
  declare -a codes

  codes=("${codes[@]}" "$(text_effect reset)")

  [[ -n $1 ]] && bg=$(bg_color "$1") && codes=("${codes[@]}" "$bg")
  [[ -n $2 ]] && fg=$(fg_color "$2") && codes=("${codes[@]}" ${fg[@]})

  if [[ $CURRENT_BG != NONE && $1 != "$CURRENT_BG" ]]; then
      declare -a intermediate=("$(fg_color $CURRENT_BG)" "$(bg_color "$1")")
      PR="$PR $(ansi intermediate[@])$SEGMENT_SEPARATOR"
      PR="$PR$(ansi codes[@]) "
  else
      PR="$PR$(ansi codes[@]) "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && PR="$PR$3"
}

prompt_end() {
  [[ ! -n $CURRENT_BG ]] && return
  declare -a codes=("$(text_effect reset)" "$(fg_color "$CURRENT_BG")")
  PR="$PR $(ansi codes[@])$SEGMENT_SEPARATOR"
  declare -a reset=("$(text_effect reset)")
  PR="$PR $(ansi reset[@])"
  CURRENT_BG=''
}

prompt_virtualenv() {
  [[ ! -n $VIRTUAL_ENV ]] && return
    color=cyan
    prompt_segment $color "$PRIMARY_FG"
    prompt_segment $color white "$(basename "$VIRTUAL_ENV")"
}

prompt_context() {
  local user
  user=$(whoami)
  if [[ $user != "$DEFAULT_USER" ]]; then user+='@'; else unset user; fi
  if [[ $user || -n $SSH_CLIENT ]]; then
      prompt_segment black default "$user\\h"
  fi
}

prompt_histdt() {
  prompt_segment black default "\\! [\\A]"
}

prompt_versioncontrol() {
	local ref dirty
	if (git rev-parse --is-inside-work-tree &>/dev/null); then
		[[ -n $(git status -s 2> /dev/null | tail -n 1) ]]; dirty=$?
		ref=$(git symbolic-ref HEAD 2> /dev/null) \
      || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"

	elif (svn info &>/dev/null); then
		(svn status --ignore-externals 2>/dev/null \
      | command grep -Eq '^\s*[ACDIM!?L]'); dirty=$?
		ref=$(LANG=C svn info 2> /dev/null | \
		awk -F/ \
				'/^URL:/ {
				for (i=0; i<=NF; i++) {
					if ($i == "branches" || $i == "tags" ) {
						print $(i+1);
						break
					};
					if ($i == "trunk") { print $i; break; }
				}
				}')
	fi;

	[[ -z $ref ]] && return

	prompt_segment "$([[ $dirty -gt 0 ]] && echo 'green' || echo 'yellow')" black
	PR+="${ref/refs\/heads\// }${dirty:+ ●}"
}

prompt_dir() {
  prompt_segment blue black '\w'
}

prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+=("$(ansi_single "$(fg_color red)")✘")
  [[ $UID -eq 0 ]] && symbols+=("$(ansi_single "$(fg_color yellow)")⚡")
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+=("$(ansi_single "$(fg_color cyan)")⚙")

  [[ -n "${symbols[*]}" ]] && prompt_segment black default "${symbols[*]}"
}

build_prompt() {
	prompt_status
	[[ -z ${AG_NO_CONTEXT+x} ]] && prompt_context
	prompt_virtualenv
	prompt_dir
	prompt_versioncontrol
	prompt_end
}

set_bash_prompt() {
  RETVAL=$?
  CURRENT_BG=NONE
  PR="$(ansi_single "$(text_effect reset)")"
  build_prompt
  PS1=$PR
}

PROMPT_COMMAND=set_bash_prompt
