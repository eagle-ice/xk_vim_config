" 记录上次打开某一文件时的光标位置，并在下次打开同一文件时将光标移动到该位置 {{{
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" }}}

