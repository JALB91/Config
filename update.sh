#!/bin/bash

_OS=""
TARGET_FILE=""

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	_OS="Linux"
	TARGET_FILE=".bashrc"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	_OS="OSX"
	TARGET_FILE=".bash_profile"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
	_OS="WIN32"
	TARGET_FILE=".bashrc"
else
	echo "Unknown OS"
	return
fi

ln `dirname $0`/VimConfig/vimrc $HOME/.vimrc

ln `dirname $0`/BashConfig/bashrc $HOME/$TARGET_FILE
ln `dirname $0`/BashConfig/inputrc $HOME/.inputrc
