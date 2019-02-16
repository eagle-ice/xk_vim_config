#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"YouCompleteMe 插件 start" $1
sed -i "/call plug\#end/i Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }" $1
sed -i "/call plug\#end/i \"YouCompleteMe 插件 end" $1

echo "" >> $1
echo "\"YouCompleteMe config start $1" >> $1


if [ ! -f $HOME/.vim/.ycm_extra_conf.py ]; then
    cp $HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py $HOME/.vim/
    #在这里可以使用脚步将系统的c c++ 头文件加入到。ycm_extra_conf.py 文件中
    #flags = [ 找到这个flags 然后 在里面 参考 -Isystem 添加
fi

echo "let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'" >> $1
echo "set completeopt=longest,menu    \"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)" >> $1

echo "let g:ycm_use_clangd = \"Always\"" >> $1
echo "let g:ycm_clangd_binary_path = \"$HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clangd/output/bin/clangd\"" >> $1

echo "let g:ycm_collect_identifiers_from_tags_files=1 \" 开启 YCM 基于标签引擎" >> $1
echo "let g:ycm_min_num_of_chars_for_completion=2 \" 从第2个键入字符就开始罗列匹配项" >> $1
echo "let g:ycm_cache_omnifunc=0  \" 禁止缓存匹配项,每次都重新生成匹配项" >> $1
echo "let g:ycm_seed_identifiers_with_syntax=1    \" 语法关键字补全" >> $1

echo "\"在注释输入中也能补全" >> $1
echo "let g:ycm_complete_in_comments = 1" >> $1
echo "\"在字符串输入中也能补全" >> $1
echo "let g:ycm_complete_in_strings = 1" >> $1
echo "\"注释和字符串中的文字也会被收入补全" >> $1
echo "let g:ycm_collect_identifiers_from_comments_and_strings = 0" >> $1
echo "" >> $1

echo "function! s:CustomizeYcmQuickFixWindow()" >> $1
echo "    \" Move the window to the top of the screen." >> $1
echo "    wincmd K" >> $1
echo "    \" Set the window height to 5. " >> $1
echo "    5wincmd _ " >> $1
echo "endfunction " >> $1
echo "autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()" >> $1

echo "nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> \" 跳转到定义处" >> $1
echo "\"YouCompleteMe config end $1" >> $1
