#!/bin/bash

GOLBAL_NAME=global-6.6

if [ ! -f $HOME/${GOLBAL_NAME}.tar.gz ]; then
    wget https://ftp.gnu.org/pub/gnu/global/${GOLBAL_NAME}.tar.gz -P $HOME
fi

if [ ! -d $HOME/global/ ]; then
    cd $HOME;mkdir global
    tar xvf ${GOLBAL_NAME}.tar.gz
    cd ${GOLBAL_NAME}
    ./configure --with-sqlite3 --prefix=/net/szswork02/work/xk.yang/global
    make;make install
    if [ ! -d $HOME/.vim/plugin ]; then
        mkdir -p $HOME/.vim/plugin
    fi
    cp $HOME/global/share/gtags/gtags*.vim $HOME/.vim/plugin
    echo "export PATH=\$HOME/global/bin:\$PATH" >> $HOME/.bashrc
fi

#要在sed 中输入单双引号,需要用另外一个包裹,或者外围使用其他的
#以下两种都能达到目的
#sed -i '/call plug\#end/i Plug '"'itchyny/lightline.vim'"'' $1
#sed -i "/call plug\#end/i Plug 'itchyny/lightline.vim'" $1


sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"gtags 相关插件 start" $1
sed -i "/call plug\#end/i Plug 'ludovicchabant/vim-gutentags'" $1
sed -i "/call plug\#end/i Plug 'skywind3000/gutentags_plus'" $1
sed -i "/call plug\#end/i \"gtags 相关插件 end" $1

echo "" >> $1
echo "\"gtags config start $1" >> $1

echo "\" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名" >> $1
echo "let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']" >> $1
echo "" >> $1
echo "\" 所生成的数据文件的名称" >> $1
echo "let g:gutentags_ctags_tagfile = '.tags'" >> $1
echo "" >> $1
echo "\" 同时开启 ctags 和 gtags 支持：" >> $1
echo "let g:gutentags_modules = []" >> $1
echo "if executable('ctags')" >> $1
echo "    let g:gutentags_modules += ['ctags']" >> $1
echo "endif" >> $1
echo "if executable('gtags-cscope') && executable('gtags')" >> $1
echo "    let g:gutentags_modules += ['gtags_cscope']" >> $1
echo "endif" >> $1
echo "\" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录" >> $1
echo "let g:gutentags_cache_dir = expand('~/.cache/tags')" >> $1
echo "" >> $1
echo "\" 配置 ctags 的参数" >> $1
echo "let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']" >> $1
echo "let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']" >> $1
echo "let g:gutentags_ctags_extra_args += ['--c-kinds=+px']" >> $1
echo "" >> $1
echo "\" 如果使用 universal ctags 需要增加下面一行" >> $1
echo "\"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']" >> $1
echo "\" 禁用 gutentags 自动加载 gtags 数据库的行为" >> $1
echo "let g:gutentags_auto_add_gtags_cscope = 0" >> $1
echo "" >> $1
echo "\"gtags config end $1" >> $1
