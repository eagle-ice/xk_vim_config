#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"taglist 插件 start" $1
sed -i "/call plug\#end/i Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }" $1
sed -i "/call plug\#end/i \"taglist 插件 end" $1

echo "" >> $1
echo "\"taglist config start $1" >> $1

echo "\" 设置打开关闭快捷键F2" >> $1
echo "nmap <F2> :TlistToggle<cr>" >> $1
echo "\" 自动更新tags列表" >> $1
echo "\"let Tlist_Ctags_Cmd = 'ctags'" >> $1
echo "let g:Tlist_Auto_Update=1" >> $1
echo "\" 始终解析文件中的tag,不管taglist窗口有没有打开" >> $1
echo "let g:Tlist_Process_File_Always=1" >> $1
echo "\" 当taglist窗口是最后一个窗口时退出vim" >> $1
echo "let g:Tlist_Exit_OnlyWindow=1" >> $1
echo "\" 只显示一个文件的tags" >> $1
echo "let g:Tlist_Show_One_File=1" >> $1
echo "\" 窗口宽度" >> $1
echo "let g:Tlist_WinWidth=30" >> $1
echo "\" 只显示当前文件的tags" >> $1
echo "let g:Tlist_Enable_Fold_Column=0" >> $1
echo "\" 高亮显示当前tag" >> $1
echo "let g:Tlist_Auto_Highlight_Tag=1" >> $1
echo "\" 设置窗口显示在右侧" >> $1
echo "let g:Tlist_Use_Right_Window=1" >> $1
echo "\" 打开时光标定位于taglist窗口" >> $1
echo "let g:Tlist_GainFocus_On_ToggleOpen=1" >> $1

echo "\"taglist config end $1" >> $1
