" 去掉vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
" 设置编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
" 保留历史记录
set history=400
" 制表符
set tabstop=4
"把tab转成空格
set expandtab
set autoindent
set smarttab
set shiftwidth=4
set cindent
set softtabstop=4
set scrolloff=3  "保持光标距离屏幕顶部和底部有3行的距离，如果你设置的数值特别大，比如999，那光标永远都保持在屏幕的中部

"filetype plugin indent on
" 状态栏显示目前所执行的指令
set showcmd 

"显示行号
set number
highlight LineNr cterm=bold ctermfg=darkgray

"突出显示当前行
set cursorline

" 行控制
set linebreak
set textwidth=80
set wrap

" 控制台响铃
set vb t_vb=

" 光标从行首和行末时可以跳到另一行去
set whichwrap=b,s,<,>,[,]
" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 禁止循环搜索
set nowrapscan
"hlsearch 高亮被搜索的字符，display=lastline 在当前窗口中，如果单行长度过长，则能显示多少就显示多少，不需要将整行显示出来。
set hlsearch
set display=lastline
"set ignorecase        " 搜索模式里忽略大小写
set ignorecase smartcase " 搜索模式里智能忽略大小写
set incsearch
"set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令>时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
" 自动重新读入
set autoread

"在处理未保存或只读文件时弹出确认
set confirm
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"增强模式中的命令行自动完成操作
set wildmenu
"list:full	如果有多于一个补全，列出所有的匹配并先用第一个补全。
set wildmode=list
set showmatch "显示匹配括号
"语法高亮
syntax enable
syntax on

"保存文件的格式顺序
set fileformats=unix

" 不要备份文件（根据自己需要取舍）
set nobackup
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
"setlocal noswapfile
set noswapfile

" 加载man 手册
runtime! ftplugin/man.vim
