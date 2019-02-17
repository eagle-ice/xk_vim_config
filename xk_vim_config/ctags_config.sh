#!/bin/bash

if [ ! -d $HOME/.vim/source/ctags ]; then
    cd $HOME/.vim/source/
    git clone https://github.com/universal-ctags/ctags.git
fi

if [ ! -d $HOME/ctags/ ]; then
    mkdir $HOME/ctags
fi

if [ ! -f $HOME/ctags/bin/ctags ]; then
    cd $HOME/.vim/source/ctags/
    ./autogen.sh
    ./configure  --prefix=$HOME/ctags/
    make;make install
    echo "export PATH=\$HOME/ctags/bin:\$PATH" >> $HOME/.bashrc
fi


echo "" >> $1
echo "\"ctags config start $1" >> $1
echo "\"正确设置vimrc，读取tags(当前目录，否则向上级目录查找添加 .tags)" >> $1
echo "set tags=./.tags;,.tags" >> $1
echo "\"ctags config end $1" >> $1
