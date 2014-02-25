set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set t_Co=256

" Vundle manages itself - required!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'scratch.vim'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-abolish'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-vinegar'
Bundle 'rodjek/vim-puppet'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'nono/vim-handlebars'
Bundle 'jnwhiteh/vim-golang'
Bundle 'groenewege/vim-less'
Bundle 'chase/vim-ansible-yaml'
Bundle 'slim-template/vim-slim'
Bundle 'guns/vim-clojure-static'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Bundles to check out later
" Bundle 'taglist.vim'
" Bundle 'vim-matchit'
" Bundle 'Rykka/ColorV'
" Bundle 'gregsexton/gitv'
" Bundle 'ap/vim-css-color'
" Bundle 'leshill/vim-json'
" Bundle 'tpope/vim-bundler'
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-markdown'
" Bundle 'Shougo/neocomplcache'
" Bundle 'scrooloose/syntastic'
" Bundle 'tpope/vim-afterimage'
" Bundle 'tpope/vim-unimpaired'
" Bundle 'itspriddle/vim-jquery'
" Bundle 'msanders/snipmate.vim'
" Bundle 'henrik/vim-ruby-runner'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'mutewinter/LustyJuggler'
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'astashov/vim-ruby-debugger'
" Bundle 'scrooloose/snipmate-snippets'

" Colors
Bundle 'vydark'
Bundle 'tomasr/molokai'
Bundle 'w0ng/vim-hybrid'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-vividchalk'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

syntax on
filetype plugin indent on

" Don't litter working directory with swp and backup files
set backupdir=~/.vim/temp,.
set directory=~/.vim/temp,.

set autoindent
" set smartindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Place a $ at the end of the text object being changed
set cpoptions+=$

" Smarter searching
set ignorecase
set smartcase
set incsearch
set showmatch
" set hlsearch
" clear search highlighting
" map <leader><space> :noh<CR>

set background=dark
colorscheme hybrid
" colorscheme vydark " doesn't know python
" colorscheme molokai
" colorscheme Zenburn
" colorscheme solarized " gui only
" colorscheme jellybeans
" colorscheme codeschool " gui only
" colorscheme distinguished " annoying line highlight
" colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Bright

set encoding=utf-8
set scrolloff=5
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore+=*.pyc,*/tmp/*
set visualbell
set cursorline
set numberwidth=5
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

"set clipboard=unnamed

set nowrap
set textwidth=80
set formatoptions=qrn1

set list
set listchars=tab:▸\ ,eol:¬

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let NERDTreeWinSize = 30

let mapleader = ","

map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
map <Leader>l :CtrlP<CR>
map <Leader>p :CtrlPBuffer<CR>
" map <Leader>f :CommandTFlush<CR>
map <Leader>z :GundoToggle<CR>
map <Leader>s :Scratch<CR>
map <Leader>a :Ack
map <Leader>j :cn<CR>
map <Leader>k :cp<CR>
map <Leader>rt :!ctags --extra=+f -R *<CR>

let g:NERDSpaceDelims=1
let g:CommandTMaxHeight=20
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
" let g:syntastic_check_on_open=1
" let g:syntastic_echo_current_error=1
" let g:syntastic_enable_signs=1
" let g:syntastic_enable_balloons = 1
" let g:syntastic_enable_highlighting = 0

" don't save fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

nnoremap <Leader>vv :e $MYVIMRC<CR>
nnoremap <Leader>ss :source $MYVIMRC<CR>

set number
set relativenumber

let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0

let g:airline_powerline_fonts = 1

" Stop unindenting comments that being with #
inoremap # X#

" erb surrounds outside rails
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
