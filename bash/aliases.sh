#!/bin/bash

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias eb='nvim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias ev='nvim ~/Documents/dev/Config/nvim/init.lua'
alias eg='nvim ~/.gitconfig'
alias ll='ls -1'
alias la='ls -a'
alias pd='pushd'
alias pp='popd'
alias gsu='git submodule update --init --recursive'
alias gs='git status'
alias gl='git log --graph --decorate --oneline'
alias gf='git fetch'
alias gpu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gsd='git diff-tree --no-commit-id --name-only -r'
alias fu='python ../shared_externals/meta/fictionfactory/tools/forest/forest.py --action update --tree platform=osx buildtype=debug environment=qa extra=artist --ccache --prebuiltlibs --openide --adhoc_cmake_args Python_ROOT_DIR=/opt/homebrew/opt/python@3.11/'
alias fuios='python ../shared_externals/meta/fictionfactory/tools/forest/forest.py --action update --tree platform=ios ios_extra=ios_breakpoint_workaround ios_type=ios_dev buildtype=debug environment=qa --openide'
