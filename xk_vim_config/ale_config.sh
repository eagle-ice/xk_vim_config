#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"ale 语法检测 插件 start" $1
sed -i "/call plug\#end/i Plug 'w0rp/ale'" $1
sed -i "/call plug\#end/i \"ale 语法检测 插件 end" $1


echo "" >> $1
echo "\"ale config start $1" >> $1

echo "\" 对应语言需要安装相应的检查工具" >> $1
echo "\" https://github.com/w0rp/ale \"    let g:ale_linters_explicit = 1 \"除g:ale_linters指定，其他不可用 \"    let g:ale_linters = {" >> $1
echo "\"\\ 'cpp': ['cppcheck','clang','gcc'], \"\\   'c': ['cppcheck','clang', 'gcc']," >> $1
echo "\"\\ 'python': ['pylint'], \"\\   'bash': ['shellcheck']," >> $1
echo "\"\\ 'go': ['golint'], \"\\}" >> $1
echo "\" let g:ale_sign_column_always = 1 let g:ale_completion_delay = 500 let g:ale_echo_delay = 20 let g:ale_lint_delay = 500 let g:ale_echo_msg_format = '[%linter%] %code: %%s' let g:ale_lint_on_text_changed = 'normal' let g:ale_lint_on_insert_leave = 1 let g:airline#extensions#ale#enabled = 1 \"let g:ale_set_quickfix = 1" >> $1
echo "\"let g:ale_open_list = 1\"打开quitfix对话框" >> $1
echo "" >> $1
echo "let g:ale_c_gcc_options = '-Wall -O2 -std=c99'" >> $1
echo "let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'" >> $1
echo "let g:ale_c_cppcheck_options = ''" >> $1
echo "let g:ale_cpp_cppcheck_options = ''" >> $1
echo "" >> $1
echo "let g:ale_sign_error = \">>\"" >> $1
echo "let g:ale_sign_warning = \"--\"" >> $1
echo "map <F7> ::ALEToggle<CR>" >> $1

echo "\"ale config end $1" >> $1
