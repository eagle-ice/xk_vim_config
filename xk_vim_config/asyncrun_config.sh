#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"asyncrun 插件 start" $1
sed -i "/call plug\#end/i Plug 'skywind3000/asyncrun.vim'" $1
sed -i "/call plug\#end/i \"asyncrun 插件 end" $1
