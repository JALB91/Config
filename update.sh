#!/bin/bash

cp `dirname $0`/VimConfig/vimrc $HOME/.vimrc
cp -r `dirname $0`/VimConfig/vim $HOME/.vim
cp `dirname $0`/VimConfig/ycm_extra_conf.py $HOME/.ycm_extra_conf.py

cp `dirname $0`/BashConfig/bashrc $HOME/.bashrc
cp `dirname $0`/BashConfig/inputrc $HOME/.inputrc
