set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

set nu

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" easier splits jumping
map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-K> <C-W>k
map <C-L> <C-W>l

" move while in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
" ...and then disable the keys
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" incremental search
set incsearch

" one less keystroke...
nnoremap : ;
nnoremap ; :

" visual lines, not hard lines
nnoremap j gj
nnoremap k gk

set timeoutlen=10
set listchars=nbsp:•

function! Repeat()
        let times = input("Count: ")
        let char  = input("Char: ")
        exe ":normal a" . repeat(char, times)
endfunction

let mapleader="\\"
map <leader>rr :source ~/.vimrc<CR>
map <leader>o :syntax off<CR>

imap <C-u> <C-o>:call Repeat()<cr>
set expandtab tabstop=2 shiftwidth=2


set splitbelow
set splitright

highlight Pmenu ctermbg=grey ctermfg=black
