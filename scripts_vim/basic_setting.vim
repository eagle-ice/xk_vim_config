" 设置编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
" 保留历史记录
set history=400
" 制表符
set tabstop=4
"把tab转成空格
"set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 状态栏显示目前所执行的指令
set showcmd 

"显示行号
set number
highlight LineNr cterm=bold ctermfg=darkgray

"突出显示当前行
set cursorline

" 光标从行首和行末时可以跳到另一行去
set whichwrap=b,s,<,>,[,]
