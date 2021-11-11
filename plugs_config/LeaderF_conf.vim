Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" 打开popub
let g:Lf_WindowPosition = 'popup'
" 预览标记 无效不知道原因
let g:Lf_PreviewInPopup = 1

"" Show icons, icons are shown by default
"let g:Lf_ShowDevIcons = 1
"" " For GUI vim, the icon font can be specify like this, for example
"let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
"" " If needs
"set ambiwidth=double
"
"" 修改默认的搜索文件命令
"let g:Lf_ShortcutF = '<C-P>'
" ================rg 使用手册
" USAGE:
"    rg [OPTIONS] PATTERN [PATH ...]
"    rg [OPTIONS] [-e PATTERN ...] [-f PATTERNFILE ...] [PATH ...]
"    rg [OPTIONS] --files [PATH ...]
"    rg [OPTIONS] --type-list
"    command | rg [OPTIONS] PATTERN
" ARGS:
"     <PATTERN>
"             A regular expression used for searching. To match a pattern beginning with a
"             dash, use the -e/--regexp flag.
" 
"             For example, to search for the literal '-foo', you can use this flag:
" 
"                 rg -e -foo
" 
"             You can also use the special '--' delimiter to indicate that no more flags
"             will be provided. Namely, the following is equivalent to the above:
" 
"                 rg -- -foo
" 
"     <PATH>...
"             A file or directory to search. Directories are searched recursively. Paths specified on
"             the command line override glob and ignore rules.
"
" -A, --after-context <NUM> 显示匹配内容后的<NUM>行 会覆盖--context
" -B, --before-context <NUM>   显示匹配内容前的<NUM>行 会覆盖--context
" -b, --byte-offset    显示匹配内容在文件中的字节偏移  和-o
" 一起使用，只打印偏移
" -s, --case-sensitive 大小写敏感  会覆盖-i(ignore case), -S(smart case)
" --color <WHEN>   什么时候使用颜色，默认 auto 如果--vimgre
" 					被使用，那么默认值是 never
" 					可选项有： never, auto, always, ansi 
" --colors <COLOR_SPEC>... 设定输出颜色：  color: red, blue, green, cyan
" 											{type}:{attribute}:{value}   magenta, yellow, white, black
" 											{type}: path, line, column, match    style: nobold, bold, nointense
" 											{attribute}: fg, bg, style   intense, nounderline, underline
" 											{value}: a color or a text style Example:
" 											{type}:none会清空{type}的颜色设定    rg --colors 'match:fg:magenta'
" --colors 'line:bg:yellow' foo
" 							扩展颜色集可以被{value}使用，如果终端支持 ANSI color
" 							描述方法是'x'(256-color) 或 'x,x,x'(24-bit true color)
" 							x 是 0-255 之间的数值,默认是 10 进制， 0x 前缀是 16 进制
" 							比如: rg --colors 'match:bg:0,128,255'
" 							或者等价的：rg --colors 'match:bg:0x0,0x80,0xFF'
" 							在使用 extended color code 时 intense 和 nointense 是无效的
" --column 第一次匹配所在列数(从 1 开始)   能够被--no-column 取消掉
" -C, --context <NUM>  显示匹配内容的前面和后面的<NUM>行   它会覆盖-B 和-A " 选项
" --context-separator <SEPARATOR>  在输出中用来分隔非连续的行  x7F 或t " 可被使用，默认是--
" -c, --count  只显示匹配的行数    如果只有一个文件给
" 									ripgrep，那只打印匹配行数
" 									可以用--with-filename 来强制打印文件名
" 									它会覆盖--count-matches 选项
" --count-matches  只显示匹配的次数    可以用--with-file 来强制在只有一个文件时也输出文件名
" --debug  显示调试信息    
" --dfa-size-limit <NUM+SUFFIX?>   regex DFA 的上限， 默认 10M 
" -E, --encoding <ENCODING>    描述文本编码, 默认是 auto
" https://encoding.spec.whatwg....
" -f, --file <PATTERNFILE>...  从文件中读入 pattern, 一行一 pattern
" 可以被多次使用或和-e 一起组合使用，所以有组合会被匹配
" --files  打印所有将被搜索的文件  以rg <options> --files
" [PATH...]方式使用，不能加 pattern
" -l, --files-with-matches 只打印有匹配的文件名    覆盖--files-without-match
" --files-without-match    只打印无匹配的文件名    覆盖 --file-with-matches
" -F, --fixed-strings  把 pattern 当成常规文字而非 regex
" 可以用--no-fixed-strings 来禁止这个选项
" -L, --follow 会递归搜索链接，默认关闭    可以用--no-follow 来关闭
" -g, --glob <GLOB>... 通配符文件或文件夹，可以用!来取反   可以多次使用，
" 会匹配.gitignore 的通配符规则
" -h, --help   打印帮助信息    
" --heading    打印文件名到匹配内容的上方而不是同一行
" 这是默认行为，可以用--no-heading 来关闭
" --hidden 搜索隐藏文件和文件夹    默认忽略, 可用--no-hidden 关闭
" --iglob <GLOB>...    同--glob, 但这个大小写不敏感    
" -i, --ignore-case    pattern 大小写不敏感    可通过-s/--case-sensitive
" 或-S/--smart-case 覆盖这个选项
" --ignore-file <PATH>...  忽略路径，格式同.gitignore, 可多个
" 多个--ignore-file 标记时，后面优先级高
" 在命令上时，使用-g 来达到同样效果    
" -v, --invert-match   反向匹配    
" -n, --line-number    显示文件行数，默认打开  
" -x, --line-regexp    只显示整行都匹配 pattern 的行   会覆盖--word-regexp
" -M, --max-columns <NUM>  不打印长于<NUM>列的匹配行   
" -m, --max-count <NUM>    限制一个文件最多<NUM>行匹配 
" --max-depth <NUM>    限制文件夹递归搜索深度  rg --max-depth 0
" dir/不执行任何搜索
" --max-filesize <NUM+SUFFIX?> 忽略大于<NUM>byte 的文件    suffix 可以是 K,
" M，G, 默认是 byte
" --mmap   尽量使用 memory maps, 默认行为  目前它不支持所有选项, 用--no-mmap
" 来关闭
" --no-config  不读取 conf 文件, 忽略 RIPGREP_CONFIG_PATH  
" --no-filename    不要打印匹配文件名  
" --no-heading 在每个匹配行前都打印文件名  
" --no-ignore  取消 ignore 文件，如.gitignore, .ignore 可以用--ignore 关闭
" --no-ignore-global   取消对全局的 ignore 文件读取
" 如$HOME/.config/git/ignore
" --no-ignore-messages 取消解析.ignroe, .gitignore 文件相关错误
" 可通过--ignore-messages 关闭
" --no-ignore-parent   不读取父文件夹里的.gitignore, .ignore 文件  可通过
" --ignore-parent 关闭
" --no-ignore-vcs  只全能.ignore 文件  可通过--ignore-vcs 关闭
" -N, --no-line-number 不打印匹配行数  
" --no-messages    不打印打开和读取文件相关错误    
" -0, --null   在打印的文件路径后加一个 NUL 字符   对于 xargs 非常有用
" -o, --only-matching  只打印匹配的内容，而不是整行    
" --passthru   打印匹配和不匹配的行    
" --path-separator <SEPARATOR> 路径分隔符，在 linux 上默认是/  
" --pre <COMMAND>  用<COMMAND>处理文件，并将结果给 rg  可能有巨大的性能惩罚
" 例如 
" 					case "$1" in 
" 					*.pdf)   
" 					exec pdftotext "$1" -    
" 					;;   
" 					*)   
" 					case $(file "$1") in 
" 					_Zstandard_) 
" 					exec pzstd -cdq  
" 					;;   
" 					*)   
" 					exec cat 
" 					;;   
" 					esac 
" 					;;   
" 					esac 
" -p, --pretty --color always --heading --line-number  
" -q, --quiet  不打印到 stdout, 如果匹配发现，停止 rg  当 rg 用于 exit
" 代码时非常有用
" --regex-size-limit <NUM+SUFFIX?> 编译 regex 的上限   
" -e, --regexp <PATTERN>...    使用正则来匹配
" 可多次使用这个选项，打印匹配任何 pattern 的行
" 可以用于搜索-开头的 pattern，如rg -e -foo
" -r, --replace <REPLACEMENT_TEXT> 用相应文件代替匹配内容打印出来
" 组序号($5)可以被使用
" -z, --search-zip 在 gz,bz2,xz,lzma,lz4 文件类型中搜索
" 可通过--no-search-zip 关闭
" -S, --smart-case 如果全小写，则大小写不敏感，否则敏感
" 可通过-s/--case-sensitive 和-i/--ignore-case 关闭
" --sort-files 根据文件路径排序输出结果    会关闭并行搜索线程
" --stats  打印出统计结果  
" -a, --text   搜索二进制文件  可通过--no-text 关闭
" -j, --threads <NUM>  大约使用的线程数    
" -t, --type <TYPE>... 只搜索某种文件类型  可通过--type-lsit
" 来列出支持的文件类型
" --type-add <TYPE_SPEC>...    添加文件类型    如rg --type-add 'foo:*.foo'
" -tfoo PATTERN
" 也可以用来创建某种包含多种文件类型的规则 --type-add 'src:include:cpp,py,md'
" --type-clear <TYPE>...   清除默认的文件类型  
" --type-list  列出所有内置文件类型    
" -T, --type-not <TYPE>... 不要搜索某种文件类型    
" -u, --unrestricted   -u 搜索.gitignore 里的文件, -uu 搜索隐藏文件    -uuu
" 搜索二进制文件
" -V, --version    打印版本信息    
" --vimgrep    每一次匹配打印一行  一行有多次匹配会打印多行
" -H, --with-filename  打印匹配的文件路径，默认    可通过--no-filename 关闭
" -w, --word-regexp    把 pattern 作为单独单词匹配，与< >等价
" =================================rg 

"===== LeaderF 基本使用信息
" https://retzzz.github.io/dc9af5aa/ 
" 如下配置来自这个网址
"<C-C>, <ESC> : quit from LeaderF.
"<C-R> : switch between fuzzy search mode and regex mode.
"<C-F> : switch between full path search mode and name only search mode.
"<Tab> : switch to normal mode.
"<C-V>, <S-Insert> : paste from clipboard.
"<C-U> : clear the prompt.
"<C-J>, <C-K> : navigate the result list.
"<Up>, <Down> : recall last/next input pattern from history.
"<2-LeftMouse> or <CR> : open the file under cursor or selected(when
"                        multiple files are selected).
"<F5>  : refresh the cache.
"<C-P> : preview the result.
"<C-Up> : scroll up in the popup preview window.
"<C-Down> : scroll down in the popup preview window.
"g:Lf_ShowHidden 设置1则显示隐藏文件. 默认值0.
"g:Lf_PreviewInPopup 设置成1, 预览(preview)会在弹出(popup)窗口里显示, 而不会在原来的文件所在的窗口里显示. 默认值是0.
"g:Lf_WindowHeight 设置窗口高度
"g:Lf_CacheDirectory 设置缓存路径
"g:Lf_StlColorscheme 设置状态栏配色方案
"g:Lf_PreviewResult 设置哪几个功能自动显示preview
"g:Lf_ReverseOrder 设置为1, 结果从下到上显示, 跟fzf/CtrlP一致, 默认是0, 从上倒下显示.
"g:Lf_RgConfig	可以提前制定一系列rg选项
"g:Lf_RgStorePattern	可以指定一个vim的寄存器, 一旦检索, -e后面的内容会被存储进入这个寄存器并且转换成vim的搜索格式. 这个寄存器可以在vim的/或?搜索命令中直接使用.
"我的配置是
"```vim
"if has('nvim')
"    let s:cachedir = expand(stdpath('cache'))
"    let s:configdir = expand(stdpath('config'))
"else
"    "vim will share same folder with nvim
"    if has('win32')
"        let s:cachedir = expand('~/AppData/Local/Temp/cache/nvim')
"        let s:configdir = expand('~/AppData/Local/nvim')
"    else
"        let s:cachedir = expand('~/.cache/nvim')
"        let s:configdir = expand('~/.config/nvim')
"    endif
"endif
"let g:Lf_PreviewInPopup = 1
"let g:Lf_WindowHeight = 0.30
"let g:Lf_CacheDirectory = s:cachedir
"let g:Lf_StlColorscheme = 'powerline'
"let g:Lf_PreviewResult = {
"        \ 'File': 0,
"        \ 'Buffer': 0,
"        \ 'Mru': 0,
"        \ 'Tag': 0,
"        \ 'BufTag': 1,
"        \ 'Function': 1,
"        \ 'Line': 1,
"        \ 'Colorscheme': 0,
"        \ 'Rg': 0,
"        \ 'Gtags': 0
"        \}
"nmap <unique> <leader>fr <Plug>LeaderfRgPrompt
"nmap <unique> <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
"nmap <unique> <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
"nmap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
"nmap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary
"
"vmap <unique> <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
"vmap <unique> <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
"vmap <unique> <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
"vmap <unique> <leader>frd <Plug>LeaderfRgVisualRegexBoundary
"<leader>fr	将会在命令行显示 :Leaderf rg -e, 然后等待用户输入想要查询的正则表达式.
"<leader>fra	将会直接查询光标所在的词语或者visual模式下选中的词语, 但是没有边界. 没有边界的意思是说如果你查word, 包含abcwordxyz的行也会被搜到.
"<leader>frb	将会直接查询光标所在的词语,或者visual模式下选中的词语 但是有边界. 有边界的意思是说如果你查word, 包含abcwordxyz 的行不会被搜到, 只有包含类似abc word xyz字段的行才会被搜到.
"<leader>frc	将会直接把光标所在的词语或者visual模式下选中的词语作为正则表达式检索, 但是没有边界.
"<leader>frd	将会直接把光标所在的词语或者visual模式下选中的词语作为正则表达式检索, 但是有边界.
"
":LeaderfFile	本文第一部分讲的就是这个命令
":LeaderfBuffer	在所有打开的buffer里根据buffer的名字搜索相应的buffer, 这个可以用来替代:ls
":LeaderfBufferAll	同上, 除了加入隐藏的buffer, 比如帮助文档等.
":LeaderfMru	搜索most recently used file, 默认显示100个, 可以配置数量.
":LeaderfMruCwd	同上, 但只在当前的工作路径下搜索
":LeaderfTag	在tag文件中检索, 注意这个是ctags的tag文件.
":LeaderfBufTag	同上, 但只检索当前buffer的tags
":LeaderfBufTagAll	同上, 但查找所有listed buffers的tags
":LeaderfFunction	查找当前文件的函数或者方法, 这个基本可以用来替代tarbar
":LeaderfFunctionAll	同上, 但列出所有listed buffers的函数和方法
":LeaderfLine	在当前文件搜索行, 可以用来替代/和?
":LeaderfLineAll	同上, 但搜索所有的listed buffers的行.
":LeaderfHistoryCmd	检索所有执行过的vim命令
":LeaderfHistorySearch	检索所有执行过的vim搜索
":LeaderfSelf	列出所有LeaderF的可执行命令, 供用户检索, 有了这个, 可以不用记忆所有其他命令了.
":LeaderfHelp	在help tags检索
":LeaderfColorscheme	在所有可用的colorscheme里检索
":LeaderfFiletype	在所有可用的文件类型里检索
":LeaderfCommand	在所有可用的vim命令(包括内置的和用户定义的)里检索
":LeaderfWindow	在所有vim的windows里检索
":LeaderfRgInteractive	以交互模式执行Leaderf rg
":LeaderfRgRecall	执行执行过的最后次Leaderf rg命令
"let g:Lf_PopupPalette = {
"    \  'light': {
"    \      'Lf_hl_match': {
"    \                'gui': 'NONE',
"    \                'font': 'NONE',
"    \                'guifg': 'NONE',
"    \                'guibg': '#303136',
"    \                'cterm': 'NONE',
"    \                'ctermfg': 'NONE',
"    \                'ctermbg': '236'
"    \              },
"    \      'Lf_hl_cursorline': {
"    \                'gui': 'NONE',
"    \                'font': 'NONE',
"    \                'guifg': 'NONE',
"    \                'guibg': '#303136',
"    \                'cterm': 'NONE',
"    \                'ctermfg': 'NONE',
"    \                'ctermbg': '236'
"    \              },
"    \      },
"    \  }
"
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 1
" 配置查找工具
" let g:Lf_DefaultExternalTool = 
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_RootMarkers = ['.repo', '.root']

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader><C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader><C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
noremap <leader><C-G> :<C-U><C-R>=printf("Leaderf! rg --no-ignore %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
if has('win32')
    let g:Lf_GtagsAutoGenerate = 0
else
    let g:Lf_GtagsAutoGenerate = 1
    let g:Lf_Gtagslabel = 'native-pygments'
    noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
    noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
    noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
    noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
endif
