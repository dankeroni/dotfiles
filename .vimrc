set nocompatible
set noswapfile
set nowrap
set nu
set rnu
syntax on
set backspace=2
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set ignorecase
set smartcase
set hidden
set showcmd
set mouse=a
set splitbelow
set splitright

fu! FixGer()
    silent %s/å/\&aring;/g
    silent %s/ä/\&auml;/g
    silent %s/ö/\&ouml;/g
    silent %s/ü/\&uuml;/g
    silent %s/Å/\&Aring;/g
    silent %s/Ä/\&Auml;/g
    silent %s/Ö/\&Ouml;/g
    silent %s/Ü/\&Uuml;/g
    silent %s/ß/\&szlig;/g
endfunction

fu! UnfixGer()
    silent %s/&aring;/å/g
    silent %s/&auml;/ä/g
    silent %s/&ouml;/ö/g
    silent %s/&uuml;/ü/g
    silent %s/&Aring;/Å/g
    silent %s/&Auml;/Ä/g
    silent %s/&Ouml;/Ö/g
    silent %s/&Uuml;/Ü/g
    silent %s/&szlig;/ß/g
endfunction

"Jump to previous cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"End dein Scripts-------------------------
filetype plugin indent on
colo luna-term

"Clear search highlights
autocmd VimEnter * nnoremap <C-l> :noh<CR>

tnoremap <Esc> <C-\><C-n>

let mapleader = "m"
nmap <Leader>j J
nmap <Leader>k i<Enter><Esc>

