" 功能函数 ---------------------- {{{

" 获取当前目录 ---------------------- {{{
func GetPWD()
    return substitute(getcwd(), "", "", "g")
endf
" }}}获取当前目录
" 取得光标处的匹配 {{{
function! GetPatternAtCursor(pat)
    let col = col('.') - 1
    let line = getline('.')
    let ebeg = -1
    let cont = match(line, a:pat, 0)
    while (ebeg >= 0 || (0 <= cont) && (cont <= col))
        let contn = matchend(line, a:pat, cont)
        if (cont <= col) && (col < contn)
            let ebeg = match(line, a:pat, cont)
            let elen = contn - ebeg
            break
        else
            let cont = match(line, a:pat, contn)
        endif
    endwh
    if ebeg >= 0
        return strpart(line, ebeg, elen)
    else
        return ""
    endif
endfunction
" }}}

" }}}功能函数
