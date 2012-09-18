set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set t_Co=256

" Vundle manages itself - required!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rake'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'itspriddle/vim-jquery'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'leshill/vim-json'
"Bundle 'ap/vim-css-color'
"Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'scratch.vim'

" Colors
Bundle 'vydark'
Bundle 'tomasr/molokai'
Bundle 'cstrahan/grb256'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-vividchalk'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Bundles I need to learn
" Bundle 'mutewinter/LustyJuggler'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-unimpaired'
" Bundle 'henrik/vim-ruby-runner'
" Bundle 'astashov/vim-ruby-debugger'
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'Rykka/ColorV'
" Bundle 'tpope/vim-markdown'
" Bundle 'vim-matchit'
" Bundle 'taglist.vim'
" Bundle 'tpope/vim-abolish'
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-afterimage'
" Bundle 'scrooloose/snipmate-snippets'
" Bundle 'msanders/snipmate.vim'
" Bundle 'Shougo/neocomplcache'

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

set relativenumber

set background=dark
" colorscheme grb256 " annoying line underline
" colorscheme vydark " doesn't know python
" colorscheme molokai " nice
" colorscheme Zenburn " nice
" colorscheme solarized " gui only
colorscheme jellybeans " very nice
" colorscheme codeschool " gui only
" colorscheme distinguished " annoying line highlight
" colorscheme Tomorrow-Night " very nice
" colorscheme Tomorrow-Night-Bright " very nice

set encoding=utf-8
set scrolloff=5
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
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

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let NERDTreeWinSize = 40

let mapleader = ","

map <Leader>n :NERDTreeToggle<CR>
" map <Leader>l :CommandT<CR>
map <Leader>l :CtrlPMixed<CR>
map <Leader>p :CtrlPBuffer<CR>
map <Leader>f :CommandTFlush<CR>
map <Leader>z :GundoToggle<CR>
map <Leader>s :Scratch<CR>
map <Leader>a :Ack 
map <Leader>j :cn<CR>
map <Leader>k :cp<CR>
map <Leader>. :<up><CR>
map <Leader>rt :!ctags --extra=+f -R *<CR>

let g:NERDSpaceDelims=1 
let g:CommandTMaxHeight=20
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 0

" don't save fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

nnoremap <Leader>vv :e $MYVIMRC<CR>
nnoremap <Leader>ss :source $MYVIMRC<CR>

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Make <ESC> and arrow keys work correctly for Command-T in terminal
set ttimeoutlen=50
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0

" Stop unindenting comments that being with #
inoremap # X#
