"VIM配置件
"2016-07-11
"是否兼容VI，compatible为兼容，nocompatible为不完全兼容
"如果设置为compatible，则tab将不会变成空格
set nocompatible
"设置鼠标运行模式为WINDOWS模式
behave mswin

"设置菜单语言
set encoding=chinese 
set langmenu=zh_CN.UTF-8 

" =========
" 功能函数
" =========
" 获取当前目录
func GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" =====================
" 多语言环境
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8

    if has('win32')
        language english
        let &termencoding=&encoding
    endif

    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" =========
" 环境配置
" =========

" 保留历史记录
set history=400

" 命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l,%c\ %=\ %P 
set ls=2 " 始终显示状态行

" 制表符
set tabstop=4
"把tab转成空格
"set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 状态栏显示目前所执行的指令
set showcmd 

" 行控制
set linebreak
set nocompatible
set textwidth=80
set wrap

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 控制台响铃
:set noerrorbells
:set novisualbell
:set t_vb= "close visual bell

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 标签页
set tabpagemax=20
set showtabline=2

" 缩进 智能对齐方式
set autoindent
set smartindent

" 自动重新读入
set autoread

"代码折叠
"设置折叠模式
set foldcolumn=4
"光标遇到折叠，折叠就打开
"set foldopen=all
"移开折叠时自动关闭折叠
"set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN
"依缩进折叠
"   manual  手工定义折叠
"   indent  更多的缩进表示更高级别的折叠
"   expr    用表达式来定义折叠
"   syntax  用语法高亮来定义折叠
"   diff    对没有更改的文本进行折叠
"   marker  对文中的标志折叠
set foldmethod=syntax
"启动时不要自动折叠代码
set foldlevel=100
"依标记折叠
set foldmethod=marker

"语法高亮
syntax enable
syntax on

"设置配色
set guifont=Courier\ New:h12
colorscheme desert

"设定文件浏览器目录为当前目录
set bsdir=buffer

" 自动切换到文件当前目录
set autochdir

"在查找时忽略大小写
set ignorecase
set incsearch
set hlsearch
 
"设置命令行的高度
set cmdheight=2

"显示匹配的括号
set showmatch

"增强模式中的命令行自动完成操作
set wildmenu

"使PHP识别EOT字符串
hi link phpheredoc string
"php语法折叠
let php_folding = 1
"允许在有未保存的修改时切换缓冲区
set hidden

"实现全能补全功能，需要打开文件类型检测
"filetype plugin indent on
"打开vim的文件类型自动检测功能
"filetype on

"保存文件的格式顺序
set fileformats=dos,unix
"置粘贴模式，这样粘贴过来的程序代码就不会错位了。
set paste

"在所有模式下都允许使用鼠标，还可以是n,v,i,c等
set mouse=a

" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"取得光标处的匹配
function! GetPatternAtCursor(pat)
    let col = col('.') - 1
    let line = getline('.')
    let ebeg = -1
    let cont = match(line, a:pat, 0)
    while (ebeg >= 0 || (0 <= cont) && (cont <= col))
        let contn = matchend(line, a:pat, cont)
        if (cont <= col) && (col < contn)
            let ebeg = match(line, a:pat, cont)
            let elen = contn - ebeg
            break
        else
            let cont = match(line, a:pat, contn)
        endif
    endwh
    if ebeg >= 0
        return strpart(line, ebeg, elen)
    else
        return ""
    endif
endfunction

" =========
" 图形界面
" =========
if has('gui_running')
    " 只显示菜单
    set guioptions=mcr

    " 高亮光标所在的行
    set cursorline

    " 编辑器配色
	colorscheme desert
    "colorscheme zenburn
    "colorscheme dusk

    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/vimrc_example.vim
		source $VIMRUNTIME/mswin.vim

		"设置鼠标运行模式为WINDOWS模式
		behave mswin

        " f11 最大化
        map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>

        " 字体配置
        exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h12:cANSI'
        "exec 'set guifontwide='.iconv('微软雅黑', &enc, 'gbk').':h12'
    endif

    if has("unix") && !has('gui_macvim')
        set guifont=Courier\ 10\ Pitch\ 11
        set guifontwide=YaHei\ Consolas\ Hybrid\ 11
    endif

    if has("mac") || has("gui_macvim")
        set guifont=Courier\ New:h16.00
        "set guifontwide=YaHei\ Consolas\ Hybrid:h16.00
        "set guifont=Monaco:h16
        "set guifont=Droid\ Sans\ Mono:h14
        set guifontwide=YouYuan:h14
        if has("gui_macvim")
            "set transparency=4
            set lines=200 columns=142

            let s:lines=&lines
            let s:columns=&columns
            func! FullScreenEnter()
                set lines=999 columns=999
                set fu
            endf

            func! FullScreenLeave()
                let &lines=s:lines
                let &columns=s:columns
                set nofu
            endf

            func! FullScreenToggle()
                if &fullscreen
                    call FullScreenLeave()
                else
                    call FullScreenEnter()
                endif
            endf
        endif
    endif
endif

" Under the Mac(MacVim)
if has("gui_macvim")
    
    " Mac 下，按 \ff 切换全屏
    map <Leader><Leader>  :call FullScreenToggle()<cr>

    " Set input method off
    set imdisable

    " Set QuickTemplatePath
    let g:QuickTemplatePath = $HOME.'/.vim/templates/'

    lcd ~/Desktop/

    " 自动切换到文件当前目录
    set autochdir

    " Set QuickTemplatePath
    let g:QuickTemplatePath = $HOME.'/.vim/templates/'


endif

"设置VIM状态栏
set laststatus=2 "显示状态栏(默认值为1, 无法显示状态栏)
set statusline=  "[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&fileencoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
if filereadable(expand("~/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif

" =========
" 插件
" =========
filetype plugin indent on

"html自动输入匹配标签，输入>之后自动完成匹配标签
au FileType xhtml,xml so ~/.vim/plugin/html_autoclosetag.vim

"Auto completion using the TAB key " 自动补全括号，引号
"This function determines, wether we are on 
"the start of the line text(then tab indents) 
"or if we want to try auto completion 
function! InsertTabWrapper() 
     let col=col('.')-1 
     if !col || getline('.')[col-1] !~ '\k' 
         return "\<TAB>" 
     else 
         return "\<C-N>" 
     endif 
endfunction 
 
"Remap the tab key to select action with InsertTabWrapper 
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf
" =========
" AutoCmd
" =========
if has("autocmd")
    filetype plugin indent on

    " 括号自动补全
    func! AutoClose()
        :inoremap ( ()<ESC>i
        ":inoremap " ""<ESC>i
        ":inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf

    func! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf

    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END

    "auto close quotation marks for PHP, Javascript, etc, file
    au FileType php,c,python,javascript exe AutoClose()

    " Auto Check Syntax
    au BufWritePost,FileWritePost *.js,*.php call CheckSyntax(1)

    " JavaScript 语法高亮
    au FileType html,javascript let g:javascript_enable_domhtmlcss = 1

    " 给 Javascript 文件添加 Dict
    if has('gui_macvim') || has('unix')
        au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
    else 
        au FileType javascript setlocal dict+=$VIM/vimfiles/dict/javascript.dict
    endif

    " 格式化 JavaScript 文件
    "au FileType javascript map <f12> :call g:Jsbeautify()<cr>
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

    " 给 CSS 文件添加 Dict
    if has('gui_macvim') || has('unix')
        au FileType css setlocal dict+=~/.vim/dict/css.dict
    else
        au FileType css setlocal dict+=$VIM/vimfiles/dict/css.dict
    endif

    " 增加 ActionScript 语法支持
    au BufNewFile,BufRead *.as setf actionscript 

    " 自动最大化窗口
    if has('gui_running')
        if has("win32")
            au GUIEnter * simalt ~x
        "elseif has("unix")
            "au GUIEnter * winpos 0 0
            "set lines=999 columns=999
        endif
    endif
endif

let g:SuperTabDefaultCompletionType = '<c-x><c-u>'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionType=2 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'css' : '~/.vim/dist/css.dic',
    \ 'php' : '~/.vim/dict/php.dic',
    \ 'javascript' : '~/.vim/dict/javascript.dic',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
let g:neocomplcache_snippets_dir="~/.vim/snippets"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
if has("win32")                "设定windows系统中ctags程序的位置
let Tlist_Ctags_Cmd = 'ctags'
elseif has("linux")              "设定linux系统中ctags程序的位置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 

" =========
" 快捷键
" =========
map cal :Calendar<cr>
map cse :ColorSchemeExplorer
"==== F3 NERDTree 切换 ====
let NERDTreeWinSize=22
"map ntree :NERDTree <cr>
"map nk :NERDTreeClose <cr>
"map <leader>n :NERDTreeToggle<cr>
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
"==== F4 Tag list 切换 ====
map <silent> <F4> :TlistToggle<cr> 

" 标签相关的快捷键 Ctrl
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tc :tabclose<cr>
map <C-t> :tabnew<cr>
map <C-p> :tabprevious<cr>
map <C-n> :tabnext<cr>
map <C-k> :tabclose<cr>
map <C-Tab> :tabnext<cr>

" 新建 XHTML 、PHP、Javascript 文件的快捷键
nmap <C-c><C-h> :NewQuickTemplateTab xhtml<cr>
nmap <C-c><C-p> :NewQuickTemplateTab php<cr>
nmap <C-c><C-j> :NewQuickTemplateTab javascript<cr>
nmap <C-c><C-c> :NewQuickTemplateTab css<cr>

" 在文件名上按gf时，在新的tab中打开
map gf :tabnew <cfile><cr>


"jquery 配色
au BufRead,BufNewFile *.js set syntax=jquery

" jsLint for Vim
let g:jslint_highlight_color  = '#996600'
" 指定 jsLint 调用路径，通常不用更改
let g:jslint_command = $HOME . '\/.vim\/jsl\/jsl'
" 指定 jsLint 的启动参数，可以指定相应的配置文件
let g:jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -process'


" 返回当前时间
func! GetTimeInfo()
    "return strftime('%Y-%m-%d %A %H:%M:%S')
    return strftime('%Y-%m-%d %H:%M:%S')
endfunction

" 插入模式按 Ctrl + D(ate) 插入当前时间
imap <C-d> <C-r>=GetTimeInfo()<cr>

"缺省不产生备份文件
set nobackup
set nowritebackup

" autoload _vimrc
autocmd! bufwritepost _vimrc source %

" ==================
" plugin list
" ==================
"Color Scheme Explorer
"jsbeauty \ff
"NERDTree
"Calendar
"conquer_term
"nerd_commenter

"/*========================================*\
"               常用指令收集
"\*========================================*/
"   系统时间
"   :map <F7> a<C-R>=strftime("%c")<CR><esc>
"   :s/__date__/\=strftime("%c")/

"/*---------------------------------------*\
"               基础命令
"/*---------------------------------------*\
"   ctrl+q              可以联合复制，粘贴，替换用 行操作
"   ctrl+w+j ctrl+w+k (:bn :bp :bd)

"   '.                  它移动光标到上一次的修改行
"   `.                  它移动光标到上一次的修改点
"   .                   重复上次命令
"   <C-O> :             依次沿着你的跳转记录向回跳 (从最近的一次开始)
"   <C-I> :             依次沿着你的跳转记录向前跳
"   ju(mps) :           列出你跳转的足迹
"   :history :          列出历史命令记录
"   :his c :            命令行命令历史
"   :his s :            搜索命令历史
"   q/ :                搜索命令历史的窗口
"   q: :                命令行命令历史的窗口
"   g ctrl+g            计算文件字符
"   {,}                 前进至上一段落前进至后一段落
"   gg,G(2G)            文件首
"   gd dw gf ga(进制转化)
"   gg=G 全篇自动缩进 , =G 单行缩进

"* ci[ 删除一对 [] 中的所有字符并进入插入模式
"* ci( 删除一对 () 中的所有字符并进入插入模式
"* ci< 删除一对 <> 中的所有字符并进入插入模式
"* ci{ 删除一对 {} 中的所有字符并进入插入模式
"* cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
"* ci” ci’ ci` 删除一对引号字符 (” 或 ‘ 或 `) 中所有字符并进入插入模式
"
"* vi[ 选择一对 [] 中的所有字符
"* vi( 选择一对 () 中的所有字符
"* vi< 选择一对 <> 中的所有字符
"* vi{ 选择一对 {} 中的所有字符
"* vit 选择一对 HTML/XML 的标签内部的所有字符
"* vi” vi’ vi` 选择一对引号字符 (” 或 ‘ 或 `) 中所有字符

"   crl+] 函数原型处 crl+t 回 ( ctags )
"   ctl+p 自动补全( 编辑状态 )
"   :X 加密保存( 要输入密码 )
"   ? /         (N n)
"   f(F,t) 查找字符
"   w(e) 移动光标到下一个单词.
"   5fx 表示查找光标后第 5 个 x 字符.
"   5w(e) 移动光标到下五个单词.

"   b 移动光标到上一个单词.
"   0 移动光标到本行最开头.
"   ^ 移动光标到本行最开头的字符处.
"   $ 移动光标到本行结尾处.
"   H 移动光标到屏幕的首行.
"   M 移动光标到屏幕的中间一行.
"   L 移动光标到屏幕的尾行.

"   c-f (即 ctrl 键与 f 键一同按下)
"   c-b (即 ctrl 键与 b 键一同按下) 翻页
"   c-d (下半页) c-u(上半页) c-e (一行滚动)
"   zz 让光标所在的行居屏幕中央
"   zt 让光标所在的行居屏幕最上一行
"   zb 让光标所在的行居屏幕最下一行


"   在 vi 中 y 表示拷贝, d 表示删除, p 表示粘贴. 其中拷贝与删除是与光标移动命令
"   yw 表示拷贝从当前光标到光标所在单词结尾的内容.
"   dw 表示删除从当前光标到光标所在单词结尾的内容.
"   y0 表示拷贝从当前光标到光标所在行首的内容.
"   d0 表示删除从当前光标到光标所在行首的内容.
"   y$(Y) 表示拷贝从当前光标到光标所在行尾的内容.
"   d$(D) 表示删除从当前光标到光标所在行尾的内容.
"   yfa 表示拷贝从当前光标到光标后面的第一个a字符之间的内容.
"   dfa 表示删除从当前光标到光标后面的第一个a字符之间的内容.
"   s(S),a(A),x(X),D
"   yy 表示拷贝光标所在行.
"   dd 表示删除光标所在行.

"   5yy 表示拷贝光标以下 5 行.
"   5dd 表示删除光标以下 5 行.
"   y2fa 表示拷贝从当前光标到光标后面的第二个a字符之间的内容.
"   :12,24y 表示拷贝第12行到第24行之间的内容.
"   :12,y 表示拷贝第12行到光标所在行之间的内容.
"   :,24y 表示拷贝光标所在行到第24行之间的内容. 删除类似.
"   TAB 就是制表符, 单独拿出来做一节是因为这个东西确实很有用.
"   << 输入此命令则光标所在行向左移动一个 tab.
"   >> 输入此命令则光标所在行向右移动一个 tab.
"   5>> 输入此命令则光标后 5 行向右移动一个 tab.
"   :5>>(>>>) :>>(>>>)5
"   :12,24> 此命令将12行到14行的数据都向右移动一个 tab.
"   :12,24>> 此命令将12行到14行的数据都向右移动两个 tab.
"   :set shiftwidth=4 设置自动缩进 4 个空格, 当然要设自动缩进先.
"   :set sts=4 即设置 softtabstop 为 4. 输入 tab 后就跳了 4 格.
"   :set tabstop=4 实际的 tab 即为 4 个空格, 而不是缺省的 8 个.
"   :set expandtab 在输入 tab 后, vim 用恰当的空格来填充这个 tab.
"   :g/^/exec 's/^/'.strpart(line('.').' ', 0, 4) 在行首插入行号
"   set ai 设置自动缩进
"   5ia<esc> 重复插入5个a字符

"/*---------------------------------------*\
"               替换命令
"/*---------------------------------------*\
"   替换文字 2009-02-34 ----> 2009-02-34 00:00:00
"   :%s/\(\d\{4\}-\d\{2\}-\d\{2\}\)/\1 00:00:00/g

"   :s/aa/bb/g              将光标所在行出现的所有包含 aa 的字符串中的 aa 替换为 bb
"   :s/\/bb/g               将光标所在行出现的所有 aa 替换为 bb, 仅替换 aa 这个单词
"   :%s/aa/bb/g             将文档中出现的所有包含 aa 的字符串中的 aa 替换为 bb
"   :12,23s/aa/bb/g         将从12行到23行中出现的所有包含 aa 的字符串中的 aa 替换为 bb
"   :12,23s/^/#/            将从12行到23行的行首加入 # 字符
"   :%s/fred/joe/igc            一个常见的替换命令，修饰符igc和perl中一样意思
"   s/dick/joe/igc则        对于这些满足条件的行进行替换

"   :g/^\s*$/d              空行(空格也不包含)删除.
"   :%s/\r//g               删除DOS方式的回车^M
"   :%s/ *$//               删除行尾空白(%s/\s*$//g)
"   :g!/^dd/d               删除不含字符串'dd'开头的行
"   :v/^dd/d                同上,译释：v == g!，就是不匹配！
"   :v/./.,/./-1join        压缩空行(多行空行合并为一行)
"   :g/^$/,/./-j            压缩空行(多行空行合并为一行)
"   :g/^/pu _               把文中空行扩增一倍 (pu = put),原来两行间有一个空行，现在变成2个
"   :g/^/m0                 按行翻转文章 (m = move)
"   :g/fred/,/joe/d         not line based (very powerfull)
"   :g/<input\|<form/p      或者 要用\|
"   :g/fred/t$              拷贝行，从fred到文件末尾(EOF)

"   :%norm jdd              隔行删除,译释：%指明是对所有行进行操作,norm指出后面是normal模式的指令,j是下移一行，dd是删除行

"   :'a,'bg/fred/s/dick/joe/igc   ('a,'b指定一个范围：mark a ~ mark b)
"   g//用一个正则表达式指出了进行操作的行必须可以被fred匹配,g//是一个全局显示命令

"   /joe/e                  光标停留在匹配单词最后一个字母处
"   /joe/e+1                光标停留在匹配单词最后一个字母的下一个字母处
"   /joe/s                  光标停留在匹配单词第一个字母处
"   /^joe.*fred.*bill/      标准正则表达式
"   /^[A-J]\+/              找一个以A~J中一个字母重复两次或以上开头的行
"   /forum\(\_.\)*pent      多行匹配
"   /fred\_s*joe/i          中间可以有任何空白，包括换行符\n
"   /fred\|joe              匹配FRED或JOE
"   /\<fred\>/i             匹配fred,fred必须是一个独立的单词，而不是子串
"   /\<\d\d\d\d\>           匹配4个数字 \<\d\{4}\>

"   列，替换所有在第三列中的str1
"   :%s:\(\(\w\+\s\+\)\{2}\)str1:\1str2:
"   交换第一列和最后一列 (共4列)
"   :%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:

"   全局(global)显示命令，就是用 :g＋正则表达式
"   译释： :g/{pattern}/{cmd} 就是全局找到匹配的,然后对这些行执行命令{cmd}
"   :g/\<fred\>/                                显示所有能够为单词fred所匹配的行
"   :g/<pattern>/z#.5                           显示内容，还有行号
"   :g/<pattern>/z#.5|echo '=========='         漂亮的显示

"/*---------------------------------------*\
"           多文档操作 (基础)
"/*---------------------------------------*\
"    用 :ls! 可以显示出当前所有的buffer
"   :bn                 跳转到下一个buffer
"   :bp                 跳转到上一个buffer
"   :wn                 存盘当前文件并跳转到下一个
"   :wp                 存盘当前文件并跳转到上一个
"   :bd                 把这个文件从buffer列表中做掉
"   :b 3                跳到第3个buffer
"   :b main             跳到一个名字中包含main的buffer

"/*---------------------------------------*\
"           列复制
"/*---------------------------------------*\
"   译注：@#%&^#*^%#$!
"   :%s= [^ ]\+$=&&= : 复制最后一列
"   :%s= \f\+$=&&= : 一样的功能
"   :%s= \S\+$=&& : ft,还是一样
"   反向引用，或称记忆
"   :s/\(.*\):\(.*\)/\2 : \1/ : 颠倒用:分割的两个字段
"   :%s/^\(.*\)\n\1/\1$/ : 删除重复行
"   非贪婪匹配，\{-}
"   :%s/^.\{-}pdf/new.pdf/ : 只是删除第一个pdf
"   跨越可能的多行
"   :%s/<!--\_.\{-}-->// : 又是删除多行注释（咦？为什么要说「又」呢？）
"   :help /\{-} : 看看关于 非贪婪数量符 的帮助
"   :s/fred/<c-r>a/g : 替换fred成register a中的内容，呵呵
"   写在一行里的复杂命令
"   :%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
"   译注：就是用 | 管道啦

"/*---------------------------------------*\
"           大小写转换
"/*---------------------------------------*\
"   g~~ : 行翻转
"   vEU : 字大写(广义字)
"   vE~ : 字翻转(广义字)
"   ~   将光标下的字母改变大小写
"   3~  将下3个字母改变其大小写
"   g~w 字翻转
"   U   将可视模式下的字母全改成大写字母
"   gUU 将当前行的字母改成大写
"   u   将可视模式下的字母全改成小写
"   guu 将当前行的字母全改成小写
"   gUw 将光标下的单词改成大写。
"   guw 将光标下的单词改成小写。


"   文件浏览
"   :Ex : 开启目录浏览器，注意首字母E是大写的
"   :Sex : 在一个分割的窗口中开启目录浏览器
"   :ls : 显示当前buffer的情况
"   :cd .. : 进入父目录
"   :pwd
"   :args : 显示目前打开的文件
"   :lcd %:p:h : 更改到当前文件所在的目录
"    译释：lcd是紧紧改变当前窗口的工作路径，% 是代表当前文件的文件名,
"    加上 :p扩展成全名（就是带了路径），加上 :h析取出路径

"/*========================================*\
"                   END
"\*========================================*/
