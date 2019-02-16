#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"airline 插件 start" $1
sed -i "/call plug\#end/i Plug 'vim-airline/vim-airline'" $1
sed -i "/call plug\#end/i Plug 'vim-airline/vim-airline-themes'" $1
sed -i "/call plug\#end/i \"airline 插件 end" $1
