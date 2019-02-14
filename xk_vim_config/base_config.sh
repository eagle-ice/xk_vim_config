#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"base 插件 start" $1
sed -i "/call plug\#end/i \"base 插件 end" $1


echo "" >> $1
echo "\"base config start $1" >> $1
echo "\"设置编码" >> $1
echo "set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1" >> $1
echo "set termencoding=utf-8" >> $1
echo "set encoding=utf-8" >> $1

echo "\" 去掉vi一致性模式，避免以前版本的一些bug和局限" >> $1
echo "set nocompatible" >> $1

echo "filetype on" >> $1
echo "filetype plugin on" >> $1
echo "" >> $1
echo "if has(\"autocmd\")" >> $1
echo "  \" au BufReadPost * if line(\"\'\\\"\") > 1 && line(\"\'\\\"\") <= line(\"$\") | exe \"normal! g\'\\\"\" | endif" >> $1
echo "  au BufReadPost * if line(\"\'\\\"\") > 0|if line(\"\'\\\"\") <= line(\"$\")|exe(\"norm \'\\\"\")|else|exe \"norm $\"|endif|endif" >> $1
echo "  \"have Vim load indentation rules and plugins according to the detected filetype" >> $1
echo "  filetype plugin indent on" >> $1
echo "endif" >> $1

#echo "毫无乱用" >> $1
#echo "\"让vimrc配置变更立即生效" >> $1
#echo "autocmd BufWritePost $1 source $1" >> $1

echo "" >> $1
echo "\"显示行号" >> $1
echo "\"set nu" >> $1
echo "set number" >> $1
echo "highlight LineNr cterm=bold ctermfg=darkgray" >> $1

echo "" >> $1
echo "\"突出显示当前行" >> $1
echo "set cursorline" >> $1
echo "\"set cul          'cursorline的缩写形式'" >> $1

echo "" >> $1
echo "\"突出显示当前列" >> $1
echo "\"set cuc          'cursorcolumn的缩写形式'" >> $1
echo "\"set cursorcolumn" >> $1
echo "\"set cursorline" >> $1
echo "\"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE" >> $1
echo "\"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE" >> $1

echo "" >> $1
echo "\" 不要用空格代替制表符" >> $1
echo "\"set noexpandtab" >> $1
echo "set expandtab" >> $1
echo "\"设置Tab长度为4空格" >> $1
echo "set tabstop=4" >> $1
echo "set softtabstop=4     \" 设置软制表符的宽度" >> $1
echo "set shiftwidth=4    \" (自动) 缩进使用的4个空格" >> $1

echo "set autoindent        \" 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置" >> $1
echo "set smartindent        \" 智能对齐方式" >> $1
echo "set scrolloff=3  \"保持光标距离屏幕顶部和底部有3行的距离，如果你设置的数值特别大，比如999，那光标永远都保持在屏幕的中部" >> $1
echo "" >> $1
echo "\"hlsearch 高亮被搜索的字符，display=lastline 在当前窗口中，如果单行长度过长，则能显示多少就显示多少，不需要将整行显示出来。" >> $1
echo "set hlsearch" >> $1
echo "set display=lastline" >> $1

echo "set ignorecase        \" 搜索模式里忽略大小写" >> $1
echo "\"set smartcase        \" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。" >> $1
echo "\"set autowrite        \" 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令>时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 \`{A-Z0-9} 命令转到别的文件时亦然。" >> $1
echo "set wrap \"换行用wrap 不换行为nowrap" >> $1

echo "\"set cindent            \" 使用 C/C++ 语言的自动缩进方式" >> $1
echo "\"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     \"设置C/C++语言的具体缩进方式" >> $1
echo "\"set showmatch        \" 设置匹配模式，显示匹配的括号" >> $1
echo "\" 匹配括号高亮的时间（单位是十分之一秒）" >> $1
echo "\"set matchtime=5" >> $1

echo "set linebreak        \" 整词换行" >> $1
echo "set whichwrap=b,s,<,>,[,] \" 光标从行首和行末时可以跳到另一行去" >> $1
echo "set hidden \" Hide buffers when they are abandoned" >> $1
echo "" >> $1
echo "set previewwindow    \" 标识预览窗口" >> $1
echo "set history=150        \" set command history to 150  历史记录50条" >> $1
echo "\"在处理未保存或只读文件时弹出确认" >> $1
echo "set confirm" >> $1
echo "\"与windows共享剪切板" >> $1
echo "set clipboard+=unnamed" >> $1
echo "\"--状态行设置--" >> $1
echo "\" 我的状态行显示的内容（包括文件类型和解码）" >> $1
#echo "set statusline=%F%m%r%h%w\\[POS=%l,%v][%p%%]\\%{strftime(\\\"%d/%m/%y\\ -\\ %H:%M\\\")}" >> $1
echo "" >> $1
#echo "set ruler            \" 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。" >> $1
echo "\" 在状态行上显示光标所在位置的行号和列号" >> $1
#echo "set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)" >> $1
echo "\" 保存全局变量" >> $1
echo "\"set viminfo+=!" >> $1

echo "\" 带有如下符号的单词不要被换行分割" >> $1
echo "set iskeyword+=_,$,@,%,#,-" >> $1
echo "" >> $1
echo "\" 文件设置" >> $1
echo "\" 不要备份文件（根据自己需要取舍）" >> $1
echo "set nobackup" >> $1
echo "\" 不要生成swap文件，当buffer被丢弃的时候隐藏它" >> $1
echo "\"setlocal noswapfile" >> $1
echo "set noswapfile" >> $1
echo "set bufhidden=hide" >> $1
echo "" >> $1
echo "\" 增强模式中的命令行自动完成操作" >> $1
echo "set wildmenu" >> $1
echo "" >> $1
echo "\" 命令行（在状态行下）的高度，默认为1，这里是2" >> $1
echo "set cmdheight=1" >> $1
echo "" >> $1
echo "\" 允许backspace和光标键跨越行边界" >> $1
echo "set whichwrap+=<,>,h,l" >> $1
echo "" >> $1
echo "\" 使回格键（backspace）正常处理indent, eol, start等" >> $1
echo "set backspace=2" >> $1
echo "" >> $1
echo "\" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）" >> $1
echo "set mouse=v            \" Enable mouse usage (all modes)    \"使用鼠标\"" >> $1
echo "map <C-c> :set mouse=v<CR>" >> $1
echo "map <C-x> :set mouse=a<CR>" >> $1
echo "set selection=exclusive" >> $1
echo "set selectmode=mouse,key" >> $1
echo "" >> $1
echo "\" 通过使用: commands命令，告诉我们文件的哪一行被改变过" >> $1
echo "set report=0" >> $1
echo "\" 输入:set list命令是应该显示些啥？" >> $1
echo "set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$" >> $1
echo "" >> $1
echo "\" 不让vim发出讨厌的滴滴声" >> $1
echo "\"set noerrorbells" >> $1
echo "\" 不要闪烁" >> $1
echo "set novisualbell" >> $1
echo "" >> $1
echo "\" 在被分割的窗口间显示空白，便于阅读" >> $1
echo "set fillchars=vert:\\ ,stl:\\ ,stlnc:\\" >> $1
echo "" >> $1
echo "\"--命令行设置--" >> $1
echo "set showcmd            \" 命令行显示输入的命令" >> $1
echo "set showmode        \" 命令行显示vim当前模式" >> $1

echo "" >> $1
echo "set showmatch \"自动匹配括号" >> $1


echo "\"底部状态条设置" >> $1
echo "" >> $1
echo "set laststatus=2 \" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行" >> $1
echo "set statusline=" >> $1
echo "set statusline+=%7*\\[%n]                                      \" buffernr" >> $1
echo "set statusline+=%1*\\ %<%F\\                                    \" 文件路径" >> $1
echo "set statusline+=%2*\\ %y\\                                      \" 文件类型" >> $1
echo "set statusline+=%3*\\ %{\'\'.(&fenc!=\'\'?&fenc:&enc).\'\'}    \" 编码1" >> $1
echo "set statusline+=%3*\\ %{(&bomb?\\\",BOM\\\":\\\"\\\")}\            \" 编码2" >> $1
echo "set statusline+=%4*\\ %{&ff}\\                              \" 文件系统(dos/unix..)" >> $1
echo "set statusline+=%5*\\ %{&spelllang}\\%{HighlightSearch()}\\  \" 语言 & 是否高亮，H表示高亮?" >> $1
echo "set statusline+=%8*\\ %=\\ row:%l/%L\\ (%03p%%)\\             \" 光标所在行号/总行数 (百分比)" >> $1
echo "set statusline+=%9*\\ col:%03c\\                            \" 光标所在列" >> $1
echo "set statusline+=%0*\\ \ %m%r%w\\ %P\\ \\                      \" Modified? Read only? Top/bottom" >> $1
echo "function! HighlightSearch()" >> $1
echo "    if &hls" >> $1
echo "        return 'H'" >> $1
echo "    else" >> $1
echo "        return ''" >> $1
echo "    endif" >> $1
echo "endfunction" >> $1
echo "hi User1 ctermfg=white  ctermbg=darkred" >> $1
echo "hi User2 ctermfg=blue  ctermbg=58" >> $1
echo "hi User3 ctermfg=white  ctermbg=100" >> $1
echo "hi User4 ctermfg=darkred  ctermbg=95" >> $1
echo "hi User5 ctermfg=darkred  ctermbg=77" >> $1
echo "hi User7 ctermfg=darkred  ctermbg=138  cterm=bold" >> $1
echo "hi User8 ctermfg=231  ctermbg=darkgray" >> $1
echo "\"hi User9 ctermfg=\#ffffff  ctermbg=\#810085" >> $1
echo "hi User0 ctermfg=yellow  ctermbg=138" >> $1

echo "" >> $1
echo "\"设置粘贴模式" >> $1
echo "\"在Vim中通过鼠标右键粘贴时会在行首多出许多缩进和空格，通过set paste" >> $1
echo "\"可以在插入模式下粘贴内容时不会有任何格式变形、胡乱缩进等问题和上面的缩进冲突, 在需要粘贴的时候手动设置" >> $1
echo "\"set paste" >> $1


echo "\"base config end $1" >> $1
