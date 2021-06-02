onoremap in( :<c-u>normal! f(vi(<cr>
onoremap inw :<c-u>normal! f(lviw<cr>

vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>2l
vnoremap <leader>' <esc>a'<esc>`<i'<esc>`>2l
vnoremap <leader>( <esc>a)<esc>`<i(<esc>`>2l
vnoremap <leader>[ <esc>a]<esc>`<i[<esc>`>2l
vnoremap <leader>{ <esc>a}<esc>`<i{<esc>`>2l

nnoremap <leader>" viw<esc>a"<esc>`<i"<esc>`>2l
nnoremap <leader>" viw<esc>a"<esc>`<i"<esc>`>2l
nnoremap <leader>" viw<esc>a"<esc>`<i"<esc>`>2l
nnoremap <leader>" viw<esc>a"<esc>`<i"<esc>`>2l
nnoremap <leader>" viw<esc>a"<esc>`<i"<esc>`>2l

nnoremap <leader>t :terminal<cr>
nnoremap <leader>l :vertical terminal<cr>
nnoremap <leader>r :vertical rightb terminal<cr>

nmap <leader>fw :lv /<c-r>=expand("<cword>")<esc>/ %<cr>:lw<cr>
nmap <leader>fs :lv // %<cr>:lw<cr>

