#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"nerdtree 插件 start" $1
sed -i "/call plug\#end/i Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }" $1
sed -i "/call plug\#end/i \"nerdtree 插件 end" $1


echo "" >> $1
echo "\"nerdtree config start $1" >> $1
echo "\"nerdtree 配置" >> $1
echo "\"-- Nerdtree setting --" >> $1
echo "\"map <F2> :NERDTreeToggle<CR>" >> $1
echo "\"map <F2> :NERDTreeFind<CR>" >> $1
echo "\"let NERDTreeChDirMode=2  \"选中root即设置为当前目录" >> $1
echo "\"let NERDTreeQuitOnOpen=1 \"打开文件时关闭树" >> $1
echo "\"let NERDTreeShowBookmarks=1 \"显示书签" >> $1
echo "\"let NERDTreeMinimalUI=1 \"不显示帮助面板" >> $1
echo "\"let NERDTreeDirArrows=0 \"目录箭头 1 显示箭头  0传统+-\|号" >> $1
echo "\"3.自定义选项" >> $1
echo "\"--------------------------------------------------------------------------------" >> $1
echo "\"loaded_nerd_tree            不使用NerdTree脚本" >> $1
echo "\"NERDChristmasTree           让Tree把自己给装饰得多姿多彩漂亮点" >> $1
echo "\"NERDTreeAutoCenter" >> $1
echo "\"控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心" >> $1
echo "\"NERDTreeAutoCenterThreshold 与NERDTreeAutoCenter配合使用" >> $1
echo "\"NERDTreeCaseSensitiveSort   排序时是否大小写敏感" >> $1
echo "\"NERDTreeChDirMode           确定是否改变Vim的CWD" >> $1
echo "\"NERDTreeHighlightCursorline 是否高亮显示光标所在行" >> $1
echo "\"NERDTreeHijackNetrw         是否使用:edit命令时打开第二NerdTree" >> $1
echo "\"NERDTreeIgnore              默认的“无视”文件" >> $1
echo "\"NERDTreeBookmarksFile       指定书签文件" >> $1
echo "\"NERDTreeMouseMode" >> $1
echo "\"指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）" >> $1
echo "\"NERDTreeQuitOnOpen          打开文件后是否关闭NerdTree窗口" >> $1
echo "\"NERDTreeShowBookmarks       是否默认显示书签列表" >> $1
echo "\"NERDTreeShowFiles           是否默认显示文件" >> $1
echo "\"NERDTreeShowHidden          是否默认显示隐藏文件" >> $1
echo "\"NERDTreeShowLineNumbers     是否默认显示行号" >> $1
echo "\"NERDTreeSortOrder           排序规则" >> $1
echo "\"NERDTreeStatusline          窗口状态栏" >> $1
echo "\"NERDTreeWinPos              窗口位置（'left' or 'right'）" >> $1
echo "\"NERDTreeWinSize             窗口宽" >> $1
echo "\"我的配置：" >> $1
echo "\"NERD Tree" >> $1
echo "\"let NERDChristmasTree=1" >> $1
echo "\"let NERDTreeAutoCenter=1" >> $1
echo "\"let NERDTreeMinimalUI=1 \"不显示帮助面板" >> $1
echo "\"let NERDTreeDirArrows=0 \"目录箭头 1 显示箭头  0传统+-|号" >> $1
echo "\"let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'" >> $1
echo "\"let NERDTreeMouseMode=2" >> $1
echo "\"let NERDTreeShowBookmarks=1" >> $1
echo "\"let NERDTreeShowFiles=1" >> $1
echo "\"let NERDTreeChDirMode=2  \"选中root即设置为当前目录" >> $1
echo "\"let NERDTreeShowHidden=1" >> $1
echo "\"let NERDTreeShowLineNumbers=1" >> $1
echo "\"let NERDTreeWinPos='left'" >> $1
echo "\"let NERDTreeWinSize=31" >> $1
echo "\"进入时自动打开目录" >> $1
echo "\"autocmd StdinReadPre * let s:std_in=1" >> $1
echo "\"autocmd VimEnter * if argc() == 0 && !exists(\"s:std_in\") | NERDTree | endif" >> $1
echo "\"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists(\"s:std_in\") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif" >> $1
echo "\"退出时自动关闭neartree" >> $1
echo "\"autocmd bufenter * if (winnr(\"$\") == 1 && exists(\"b:NERDTree\") && b:NERDTree.isTabTree()) | q | endif" >> $1
echo "nnoremap <F10> :NERDTreeToggle <CR>" >> $1
echo "\"nerdtree config end $1" >> $1
