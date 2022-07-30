call plug#begin()
Plug 'tpope/vim-fugitive'     " https://github.com/tpope/vim-fugitive
Plug 'airblade/vim-gitgutter' " https://github.com/airblade/vim-gitgutter
Plug 'scrooloose/nerdtree'    " https://github.com/preservim/nerdtree
Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons
Plug 'ryanoasis/nerd-fonts'   " https://github.com/ryanoasis/nerd-fonts
Plug 'sheerun/vim-polyglot'   " https://github.com/sheerun/vim-polyglot
Plug 'dense-analysis/ale'     " https://github.com/dense-analysis/ale
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'       " https://github.com/junegunn/fzf.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim
call plug#end()

set number
set expandtab
set hlsearch
set ignorecase
set incsearch
set smartcase
set laststatus=2
syntax on
set autoindent
filetype plugin indent on
set showcmd
set background=dark
set wildmenu
set ruler
set showmatch
set cursorline
set encoding=UTF-8

" setting for nerdtree
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree | wincmd p

" key bindings
nnoremap <C-p> :Files<CR>
