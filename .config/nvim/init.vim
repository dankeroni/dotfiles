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

"Download dein.vim if it doesn't exist
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif
"dein Scripts-----------------------------
set runtimepath+=$HOME/.config/nvim/repos/github.com/Shougo/dein.vim

call dein#begin(expand('$HOME/.config/nvim'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('notpratheek/vim-luna')
call dein#add('fatih/vim-go')
call dein#add('Shougo/deoplete.nvim')
call dein#add('deoplete-plugins/deoplete-go')
call dein#add('deoplete-plugins/deoplete-jedi')
call dein#add('visualfc/gocode', {'rtp': "nvim"})
call dein#add('joshuarubin/go-explorer')
call dein#add('jiangmiao/auto-pairs')

call dein#add('elzr/vim-json', {'on_ft': 'json'})

call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})
call dein#add('nelstrom/vim-markdown-folding')
call dein#add('tyru/markdown-codehl-onthefly.vim')

call dein#add('Shougo/denite.nvim')

call dein#add('mhartington/vim-folds')
call dein#add('Yggdroot/indentLine')

call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')

call dein#add('tpope/vim-repeat')
call dein#add('neomake/neomake')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('tpope/vim-surround')
call dein#add('Chiel92/vim-autoformat')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
call dein#add('Shougo/neoinclude.vim')
call dein#add('ujihisa/neco-look', {'on_ft': ['markdown','text','html']})

call dein#add('Konfekt/FastFold')

call dein#add('honza/vim-snippets')

call dein#add('mattn/webapi-vim')
call dein#add('itchyny/vim-cursorword')
call dein#add('Shougo/neomru.vim')

call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-cucumber')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-endwise')

call dein#add('moll/vim-node')
call dein#add('godlygeek/tabular')
call dein#add('walm/jshint.vim')

call dein#add('artur-shaik/vim-javacomplete2')
call dein#add('pangloss/vim-javascript')
call dein#add('tfnico/vim-gradle')

call dein#add('notpratheek/vim-luna')

call dein#add('vim-scripts/vim-auto-save')

call dein#end()


if dein#check_install()
    silent call dein#install()
    let pluginsExist=1
endif
"End dein Scripts-------------------------
filetype plugin indent on
colo luna-term
let g:deoplete#enable_at_startup = 1

"Clear search highlights
autocmd VimEnter * nnoremap <C-l> :noh<CR>
autocmd! BufWritePost * Neomake

"Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
autocmd VimEnter * map <C-n> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

tnoremap <Esc> <C-\><C-n>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let mapleader = "m"
nmap <Leader>j J
nmap <Leader>k i<Enter><Esc>

autocmd BufWrite * :Autoformat

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete
