" 基础函数区 {{{
source ${HOME}/.vim/scripts_vim/common_function.vim
" }}} 基础函数区结束

" 基础配置区 {{{
source ${HOME}/.vim/scripts_vim/basic_setting.vim
source ${HOME}/.vim/scripts_vim/status_line_setting.vim
" }}} 基础配置区结束


" 插件配置区 {{{
call plug#begin('~/.vim/plugged')
Plug 'yianwillis/vimcdoc'
Plug 'vim-scripts/c.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
source ${HOME}/.vim/scripts_vim/coc_setting.vim
call plug#end()
" }}} 插件配置结束

" 折叠区     {{{
source ${HOME}/.vim/scripts_vim/flod_setting.vim
" }}}

" 自动命令区 {{{
source ${HOME}/.vim/scripts_vim/autocmd_setting.vim
" }}} 自动命令组结束
