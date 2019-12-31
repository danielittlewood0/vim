" This is a weird script I wrote a while ago to do syntax folding for stuff
" like the output of 'tree'

setlocal foldmethod=expr
setlocal foldexpr=GetTreeFold(v:lnum)
setlocal foldtext=FoldStyle()
setlocal nowrap

function! GetTreeFold(lnum)
    let pattern = '\v^[  ├└│─]*'
    if search(pattern, 'cW') > 0
        let pre = matchstr(getline(a:lnum), pattern)
        let cols = len(split(pre,'\.*'))
        return (cols/4)
    endif
endfunction

function! FoldStyle()
  return '└' . repeat('─',79)
endfunction

hi Directory   ctermfg=blue
hi CursorLine   cterm=NONE ctermbg=blue ctermfg=white
set cursorline!
