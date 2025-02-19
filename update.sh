#!/bin/bash

OS=""

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  OS="Linux"
elif [[ "$OSTYPE" == [Dd]"arwin"* ]]; then
  OS="OSX"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  OS="WIN32"
else
  echo "Unknown OS"
  exit
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p $HOME/.config/alacritty
touch $HOME/.config/alacritty/alacritty.toml
echo "general.import = [ \"$SCRIPT_DIR/alacritty/alacritty.toml\" ]" > $HOME/.config/alacritty/alacritty.toml

touch $HOME/.bashrc
echo "source $SCRIPT_DIR/bash/bashrc.sh" > $HOME/.bashrc
