set nocompatible
set noswapfile
set nowrap
set nu
set rnu
syntax on
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set hidden

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

"Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
autocmd VimEnter * map <C-n> :NERDTreeToggle<CR>

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
call dein#add('tpope/vim-fugitive.git')
call dein#add('notpratheek/vim-luna')
call dein#add('fatih/vim-go')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('zchee/deoplete-jedi')
call dein#add('nsf/gocode', {'rtp': "nvim"})
call dein#add('garyburd/go-explorer')
call dein#add('jiangmiao/auto-pairs')

call dein#add('elzr/vim-json', {'on_ft': 'json'})
call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})

call dein#add('Shougo/denite.nvim')

call dein#add('mhartington/vim-folds')
call dein#add('Yggdroot/indentLine')

call dein#add('tpope/vim-rhubarb')
call dein#add('jreybert/vimagit')
call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')

call dein#add('tpope/vim-repeat')
call dein#add('neomake/neomake')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('tpope/vim-surround')
call dein#add('Chiel92/vim-autoformat')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('junkblocker/unite-codesearch')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
call dein#add('Shougo/neoinclude.vim')
call dein#add('ujihisa/neco-look', {'on_ft': ['markdown','text','html']})

call dein#add('Konfekt/FastFold')

call dein#add('honza/vim-snippets')
call dein#add('matthewsimo/angular-vim-snippets')

call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('itchyny/vim-cursorword')
call dein#add('Shougo/neomru.vim')
call dein#add('troydm/asyncfinder.vim')
call dein#add('nelstrom/vim-markdown-folding')
call dein#add('tyru/markdown-codehl-onthefly.vim')

call dein#add('rafi/vim-unite-issue')
call dein#add('tyru/open-browser.vim')

call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

call dein#add('maksimr/vim-jsbeautify')

call dein#end()

filetype plugin indent on

if dein#check_install()
  silent call dein#install()
  let pluginsExist=1
endif
"End dein Scripts-------------------------
set smartindent
colo luna-term
let g:deoplete#enable_at_startup = 1

"Clear search highlights
autocmd VimEnter * nnoremap <C-l> :noh<CR>
autocmd! BufWritePost * Neomake

let g:airline#extensions#tabline#enabled = 1

fu! Json()
    silent %!python -m json.tool
endfunction

tnoremap <Esc> <C-\><C-n>
nnoremap <C-p> :Unite file file_rec buffer file_mru -auto-resize -start-insert<CR>
nnoremap <C-k> :Unite line -auto-resize -start-insert<CR>
