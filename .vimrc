execute pathogen#infect()  
syntax on
filetype plugin indent on
map <space><space> :NERDTree<CR>
let g:airline_theme = 'luna'

"Strip all trailing whitespace in the file
function! StripWhitespace()
    let save_cursor = getpos(".")
    silent! %s/\s\+$// "trim whitespace from ends of lines
    silent! %s#\($\n\s*\)\+\%$## "remove trailing blank lines at eof
    call setpos('.', save_cursor)
endfunction

nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>m :wincmd _<Bar>wincmd <Bar><CR>
nnoremap <leader>sw :call StripWhitespace()<CR>
let g:AutoPairsShortcutToggle = '<leader>x'

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

set nocompatible
set foldmethod=indent
set foldnestmax=2
set bs=2    " allow backspacing over everything in insert mode
set ai      " always set autoindenting on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set background=dark
" Press enter to toggle highlighting on/off, and show current value.
:noremap <CR> :set hlsearch! hlsearch?<CR>
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
" highlight unwanted chars
set list
set listchars=tab:\ \ ,trail:·,nbsp:·
" end highlight unwanted chars
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon1
set guicursor+=i:blinkwait05
colo allomancer
autocmd BufEnter *.sql,*.yaml,*.rb colo tender

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
