set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

set nu

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-K> <C-W>k
map <C-L> <C-W>l

set timeoutlen=10
set listchars=nbsp:•

function! Repeat()
        let times = input("Count: ")
        let char  = input("Char: ")
        exe ":normal a" . repeat(char, times)
endfunction

map <leader>rr :source ~/.vimrc<CR>

imap <C-u> <C-o>:call Repeat()<cr>
set expandtab tabstop=2 shiftwidth=2

set splitbelow
set splitright

highlight Pmenu ctermbg=grey ctermfg=black
