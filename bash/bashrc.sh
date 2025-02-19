#!/bin/bash

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) exit;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Advanced pattern matching
shopt -s extglob

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
	if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
  	else
		color_prompt=
	fi
fi

if [[ "$color_prompt" = yes ]]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Git bash completion
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [[ -r /usr/share/bash-completion/bash_completion ]]; then
		. /usr/share/bash-completion/bash_completion
	elif [[ -r /etc/bash_completion ]]; then
		. /etc/bash_completion
	fi
fi

[[ -r /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh

CURR_DIR=$(dirname -- $BASH_SOURCE)

# Aliases
source $CURR_DIR/aliases.sh

# Alias Completion
source $CURR_DIR/alias_completion.sh

# Git completion
source $CURR_DIR/git-completion.sh

export INPUTRC=$CURR_DIR/inputrc

# OSX custom
if [[ $OSTYPE == [Dd]"arwin"* ]]; then
	if command -v jenv 1>/dev/null 2>&1; then
		export PATH="$HOME/.jenv/bin:$PATH"
		eval "$(jenv init -)"
	fi

	if command -v pyenv 1>/dev/null 2>&1; then
		eval "$(pyenv init -)"
	fi

	export BASH_SILENCE_DEPRECATION_WARNING=1
	export LC_ALL=en_US.UTF-8
	export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/:$PATH"

	eval "$(/opt/homebrew/bin/brew shellenv)"

	export JAVA_HOME="$(brew --prefix)/Cellar/openjdk@21/21.0.5/"
	export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/damiano.calcagni/google-cloud-sdk/path.bash.inc' ]; then . '/Users/damiano.calcagni/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/damiano.calcagni/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/damiano.calcagni/google-cloud-sdk/completion.bash.inc'; fi

export CCACHE_DIR=~/.devcache/ccache
export XDG_CONFIG_HOME="${HOME}/Documents/dev/Config"
