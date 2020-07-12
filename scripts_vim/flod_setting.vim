"代码折叠
"设置折叠模式
set foldcolumn=4
"光标遇到折叠，折叠就打开
"set foldopen=all
"移开折叠时自动关闭折叠
set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN
"依缩进折叠
"   manual  手工定义折叠
"   indent  更多的缩进表示更高级别的折叠
"   expr    用表达式来定义折叠
"   syntax  用语法高亮来定义折叠
"   diff    对没有更改的文本进行折叠
"   marker  对文中的标志折叠
augroup c_syntax_flod
    autocmd!
    autocmd BufNewFile,BufRead *.c,*h,*.cpp,*.cc setlocal foldmethod=syntax
augroup END
augroup vim_syntax_flod
    autocmd!
autocmd BufNewFile,BufRead .vimrc,vimrc,*.vim setlocal foldmethod=marker
augroup END
"启动时不要自动折叠代码
set foldlevel=100
"依标记折叠
