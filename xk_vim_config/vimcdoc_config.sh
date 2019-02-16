#!/bin/bash

sed -i '/call plug\#end/{x;p;x}' $1
sed -i "/call plug\#end/i \"vim doc 插件 start" $1
sed -i "/call plug\#end/i Plug 'yianwillis/vimcdoc'" $1
sed -i "/call plug\#end/i \"vim doc 插件 end" $1
