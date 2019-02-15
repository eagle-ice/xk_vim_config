#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"gtags 相关插件 start" $1
sed -i "/call plug\#end/i Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }" $1
sed -i "/call plug\#end/i Plug 'skywind3000/gutentags_plus'" $1
sed -i "/call plug\#end/i \"gtags 相关插件 end" $1
