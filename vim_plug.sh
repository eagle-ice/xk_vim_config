#/bin/bash

if [ ! -d ${HOME}/.vim/source ]; then
    mkdir -p ${HOME}/.vim/source;
    if [ ! -d ${HOME}/.vim/source/vim ]; then
        #sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev
        #libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev
        #ruby-dev lua5.1 liblua5.1-dev libperl-dev git
        cd ${HOME}/.vim/source
        git clone https://github.com/vim/vim.git vim
        cd ${HOME}/.vim/source/vim
        ./configure --with-features=huge --prefix=${HOME}/vim/
        make;make install
        echo "export PATH=\$HOME/vim/bin:\$PATH" >> $HOME/.bashrc
    fi
fi

cd ${HOME}/.vim/

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

source ./xk_vim_config/base_config.sh ${VIM_CONFIG_PATH}

for config_file in `find ./xk_vim_config/ -name "*.sh"`
do
    if [ x"$config_file" != x"./xk_vim_config/base_config.sh" ]; then
        echo $config_file
        source $config_file ${VIM_CONFIG_PATH}
    fi
done
