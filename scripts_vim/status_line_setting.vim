" 命令行于状态行
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
set statusline=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l,%c\ %=\ %P 
set laststatus=2 " 始终显示状态行
" 增强模式中的命令行自动完成操作
set wildmenu
