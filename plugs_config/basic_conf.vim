"base config start base.vim
"设置编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
" 去掉vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
filetype on
filetype plugin on

" 去掉vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
filetype on
filetype plugin on

if has("autocmd")
  " au BufReadPost * if line("\'\"") > 1 && line("\'\"") <= line("$") | exe "normal! g\'\"" | endif
  au BufReadPost * if line("\'\"") > 0|if line("\'\"") <= line("$")|exe("norm \'\"")|else|exe "norm $"|endif|endif
  "have Vim load indentation rules and plugins according to the detected filetype
  filetype plugin indent on
endif

set history=400

"显示行号
"set nu
set number
highlight LineNr cterm=bold ctermfg=darkgray

"突出显示当前行
set cursorline
"set cul          'cursorline的缩写形式'

"突出显示当前列
"set cuc          'cursorcolumn的缩写形式'
"set cursorcolumn
"set cursorline
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" 不要用空格代替制表符
"set noexpandtab
set expandtab
"设置Tab长度为4空格
set tabstop=4
set softtabstop=4     " 设置软制表符的宽度
set shiftwidth=4    " (自动) 缩进使用的4个空格
set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent        " 智能对齐方式
set scrolloff=3  "保持光标距离屏幕顶部和底部有3行的距离，如果你设置的数值特别大，比如999，那光标永远都保持在屏幕的中部

"hlsearch 高亮被搜索的字符，display=lastline 在当前窗口中，如果单行长度过长，则能显示多少就显示多少，不需要将整行显示出来。
set hlsearch
set display=lastline
set ignorecase        " 搜索模式里忽略大小写
"set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
"set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令>时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set wrap "换行用wrap 不换行为nowrap
"set cindent            " 使用 C/C++ 语言的自动缩进方式
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
"set showmatch        " 设置匹配模式，显示匹配的括号
" 匹配括号高亮的时间（单位是十分之一秒）
"set matchtime=5
set linebreak        " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
set hidden " Hide buffers when they are abandoned

set previewwindow    " 标识预览窗口
set history=150        " set command history to 150  历史记录50条
"在处理未保存或只读文件时弹出确认
set confirm
"与windows共享剪切板
set clipboard+=unnamed
"--状态行设置--
" 我的状态行显示的内容（包括文件类型和解码）

" 在状态行上显示光标所在位置的行号和列号
" 保存全局变量
"set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 文件设置
" 不要备份文件（根据自己需要取舍）
set nobackup
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
"setlocal noswapfile
set noswapfile
set bufhidden=hide

" 增强模式中的命令行自动完成操作
set wildmenu
set wildmode=list:full

syntax enable on
highlight CursorLine cterm=NONE ctermbg=Cyan ctermfg=NONE guibg=red guifg=NONE
set fileformats=unix
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 不让vim发出讨厌的滴滴声
"set noerrorbells
" 不要闪烁
set novisualbell

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"--命令行设置--
set showcmd            " 命令行显示输入的命令
set showmode        " 命令行显示vim当前模式

set showmatch "自动匹配括号
"底部状态条设置

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
hi User1 ctermfg=white  ctermbg=darkred
hi User2 ctermfg=blue  ctermbg=58
hi User3 ctermfg=white  ctermbg=100
hi User4 ctermfg=darkred  ctermbg=95
hi User5 ctermfg=darkred  ctermbg=77
hi User7 ctermfg=darkred  ctermbg=138  cterm=bold
hi User8 ctermfg=231  ctermbg=darkgray
"hi User9 ctermfg=\#ffffff  ctermbg=\#810085
hi User0 ctermfg=yellow  ctermbg=138

"设置粘贴模式
"在Vim中通过鼠标右键粘贴时会在行首多出许多缩进和空格，通过set paste
"可以在插入模式下粘贴内容时不会有任何格式变形、胡乱缩进等问题和上面的缩进冲突, 在需要粘贴的时候手动设置
"set paste
"base config end base.vim
colorscheme elflord
runtime! ftplugin/man.vim
