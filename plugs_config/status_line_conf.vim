" 命令行于状态行
" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=1
"set statusline=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l,%c\ %=\ %P 

"设置VIM状态栏
"set laststatus=2 "显示状态栏(默认值为1, 无法显示状态栏)
"set statusline=  "[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set statusline+=%2*%-3.3n%0*\ " buffer number
"set statusline+=%f\ " file name
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=[
"if v:version >= 600
"    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"    set statusline+=%{&fileencoding}, " encoding
"endif
"set statusline+=%{&fileformat}] " file format
"set statusline+=%= " right align
""set statusline+=%2*0x%-8B\ " current char
"set statusline+=0x%-8B\ " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

"set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
"set statusline=
"set statusline+=%7*\[%n]                                      " buffernr
"set statusline+=%1*\ %<%F\                                    " 文件路径
"set statusline+=%2*\ %y\                                      " 文件类型
"set statusline+=%3*\ %{\'\'.(&fenc!=\'\'?&fenc:&enc).\'\'}    " 编码1
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            " 编码2
"set statusline+=%4*\ %{&ff}\                              " 文件系统(dos/unix..)
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  " 语言 & 是否高亮，H表示高亮?
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             " 光标所在行号/总行数 (百分比)
"set statusline+=%9*\ col:%03c\                            " 光标所在列
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      " Modified? Read only? Top/bottom
"function! HighlightSearch()
"    if &hls
"        return 'H'
"    else
"        return ''
"    endif
"endfunction
"hi User1 ctermfg=white  ctermbg=darkred
"hi User2 ctermfg=blue  ctermbg=58
"hi User3 ctermfg=white  ctermbg=100
"hi User4 ctermfg=darkred  ctermbg=95
"hi User5 ctermfg=darkred  ctermbg=77
"hi User7 ctermfg=darkred  ctermbg=138  cterm=bold
"hi User8 ctermfg=231  ctermbg=darkgray
""hi User9 ctermfg=\#ffffff  ctermbg=\#810085
"hi User0 ctermfg=yellow  ctermbg=138

set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set statusline=
set statusline+=%7*\[%n]                                      " buffernr
set statusline+=%1*\ %<%F\                                    " 文件路径
set statusline+=%2*\ %y\                                      " 文件类型
set statusline+=%3*\ %{\'\'.(&fenc!=\'\'?&fenc:&enc).\'\'}    " 编码1
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            " 编码2
set statusline+=%4*\ %{&ff}\                              " 文件系统(dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  " 语言 & 是否高亮，H表示高亮?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             " 光标所在行号/总行数 (百分比)
set statusline+=%9*\ col:%03c\                            " 光标所在列
set statusline+=%0*\ \ %m%r%w\ %P\ \                      " Modified? Read only? Top/bottom
function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction

