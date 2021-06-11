" 记录上次打开某一文件时的光标位置，并在下次打开同一文件时将光标移动到该位置 {{{
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
" }}}
" c 语言模板，创建一个.c 文件的时候会生效，保存的时候会语法对齐 {{{
"let g:C_Styles={ '*.c,*.h' : 'default', '*.cc,*.cpp,*.hh' : 'CPP' }
"augroup c_language_template
"    autocmd!
"    autocmd BufNewFile *.c,*.cc 0read ~/.vim/language_template/c_language.template
"    autocmd BufWrite *.[ch],*.cc,*.cpp :normal gg=G
"augroup END
" }}}
