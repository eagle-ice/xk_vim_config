#/bin/bash

VIM_CONFIG_PATH=${HOME}/.vim/vimrc

if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then
    echo "install vim plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim_plug is ok!!!"
fi

if [ ! -f "${HOME}/.vim/vimrc" ]; then
    touch ~/.vim/vimrc
fi

if [ ! -f "${HOME}/.vimrc" ]; then
    ln -s ${VIM_CONFIG_PATH} ~/.vimrc
else
    rm ~/.vimrc
    ln -s ${VIM_CONFIG_PATH} ~/.vimrc
fi

echo "\"vimrc plug config begin!!!" > ${VIM_CONFIG_PATH}
echo "call plug#begin('~/.vim/plugged')" >> ${VIM_CONFIG_PATH}
echo "\"插件区" >> ${VIM_CONFIG_PATH}


echo "call plug#end()" >> ${VIM_CONFIG_PATH}
echo "\"vimrc plug config end!!!" >> ${VIM_CONFIG_PATH}

source ./xk_vim_config/gtags.sh ${VIM_CONFIG_PATH}
