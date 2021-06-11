Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

"taglist config start /home/xk/.vim/vimrc
" 设置打开关闭快捷键F2
nmap <F2> :TlistToggle<cr>
" 自动更新tags列表
"let Tlist_Ctags_Cmd = 'ctags'
let g:Tlist_Auto_Update=1
" 始终解析文件中的tag,不管taglist窗口有没有打开
let g:Tlist_Process_File_Always=1
" 当taglist窗口是最后一个窗口时退出vim
let g:Tlist_Exit_OnlyWindow=1
" 只显示一个文件的tags
let g:Tlist_Show_One_File=1
" 窗口宽度
let g:Tlist_WinWidth=30
" 只显示当前文件的tags
let g:Tlist_Enable_Fold_Column=0
" 高亮显示当前tag
let g:Tlist_Auto_Highlight_Tag=1
" 设置窗口显示在右侧
let g:Tlist_Use_Right_Window=1
" 打开时光标定位于taglist窗口
let g:Tlist_GainFocus_On_ToggleOpen=1
"taglist config end /home/xk/.vim/vimrc

"gtags 相关插件 start
"gtags 相关插件 end

"ctags config start /home/xk/.vim/vimrc
"正确设置vimrc，读取tags(当前目录，否则向上级目录查找添加 .tags)
set tags=./.tags;,.tags
"ctags config end /home/xk/.vim/vimrc
"gtags config start /home/xk/.vim/vimrc
"vimrc 中设置环境变量启用 pygments 暂时还不知道怎么启用，先注释掉等以后有需要再说
"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '$HOME/global/share/gtags/gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为, 避免多个项目数据库相互干扰,使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 1

"P 预览 大p关闭暂时 还没搞好 先注释掉 后续在打开
"autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr> 
"autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr> 
"noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
"noremap <leader>d :PreviewScroll +1<cr> " 往下滚动预览窗口
"gtags config end /home/xk/.vim/vimrc
