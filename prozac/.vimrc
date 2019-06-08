execute pathogen#infect()

syntax on
colorscheme molokai

set backspace=2
set modeline
set number
set nobackup
set nowritebackup
set noundofile

filetype indent off

set noautoindent
set nosmartindent
set nocindent
set nowrap

let g:default_modeline='# vim:ts=4:sw=4:et:'

fu! s:MakeModeline(...)
    let p = [ 'ts=' . &ts,
            \ 'sw=' . &sw,
            \ 'et',
            \ 'syn=' . &syn ]
    if a:0 == 0
        let b:effective_modeline = g:default_modeline
    else
        if a:0 > 1
            let b:effective_modeline = a:1 . ' vim:set ' . join(p, ' ') . ': ' . a:2
        else
            let b:effective_modeline = a:1 . ' vim:' . join(p, ':') . ':'
        endif
    endif
endfu

autocmd BufNewFile,BufRead *.nix      set filetype=nix
autocmd BufNewFile,BufRead *.sol      set filetype=solidity
autocmd BufNewFile,BufRead *.ts,*.tsx set filetype=typescript
autocmd BufNewFile,BufRead Packerfile set filetype=json

autocmd FileType        nix set ts=2 sw=2 et | call s:MakeModeline('#')
autocmd FileType   solidity set ts=4 sw=4 et | call s:MakeModeline('//')
autocmd FileType     python set ts=4 sw=4 et | call s:MakeModeline('#')
autocmd FileType          c set ts=4 sw=4 et | call s:MakeModeline('//')
autocmd FileType       yaml set ts=2 sw=2 et | call s:MakeModeline('#')
autocmd FileType         sh set ts=4 sw=4 et | call s:MakeModeline('#')
autocmd FileType   markdown set ts=2 sw=2 et | call s:MakeModeline('[//]: # (', ')')
autocmd FileType dockerfile set ts=2 sw=2 et | call s:MakeModeline('#')
autocmd FileType javascript set ts=2 sw=2 et | call s:MakeModeline('//')
autocmd FileType typescript set ts=2 sw=2 et | call s:MakeModeline('//')
autocmd FileType       json set ts=2 sw=2 et
autocmd FileType        css set ts=2 sw=2 et | call s:MakeModeline('/*', '*/')

command ML execute
    \ '$s@$@\r' . (exists('b:effective_modeline') ? b:effective_modeline : g:default_modeline) . '@|noh|write!|edit'

" vim:ts=4:sw=4:et:
