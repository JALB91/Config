#!/bin/bash

OS=""
TARGET_FILE=""

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  OS="Linux"
  TARGET_FILE=".bashrc"
elif [[ "$OSTYPE" == [Dd]"arwin"* ]]; then
  OS="OSX"
  TARGET_FILE=".bash_profile"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  OS="WIN32"
  TARGET_FILE=".bashrc"
else
  echo "Unknown OS"
  exit
fi

create_link() {
	if [[ $1 && -e $1 && -f $1 ]]; then
		echo -n "A \"$1\" file already exist, do you want to overwrite it? [y/n] "
		while read -r -n 1; do
			if [[ $REPLY == [Yy] ]]; then
				rm $1
				ln $2 $1
				echo
				break
			elif [[ $REPLY == [Nn] ]]; then
				echo
				return
			fi
		done
	else 
		ln $2 $1
	fi
}

create_link $HOME/$TARGET_FILE `dirname $0`/BashConfig/bashrc
create_link $HOME/.aliases `dirname $0`/BashConfig/aliases
create_link $HOME/.inputrc `dirname $0`/BashConfig/inputrc

create_link $HOME/.vimrc `dirname $0`/VimConfig/vimrc
cp -r VimConfig/vim $HOME/.vim
