call plug#begin('~/.vim/bundle')

Plug 'scratch.vim'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'nono/vim-handlebars'
Plug 'jnwhiteh/vim-golang'
Plug 'groenewege/vim-less'
Plug 'racer-rust/vim-racer'
Plug 'thoughtbot/vim-rspec'
Plug 'chase/vim-ansible-yaml'
Plug 'elixir-lang/vim-elixir'
Plug 'slim-template/vim-slim'
Plug 'guns/vim-clojure-static'
Plug 'ekalinin/Dockerfile.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/IndexedSearch'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" Colors
Plug 'w0ng/vim-hybrid'

call plug#end()

" Don't litter working directory with swp and backup files
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Place a $ at the end of the text object being changed
set cpoptions+=$

" Smarter searching
set ignorecase
set smartcase
set showmatch

set background=dark
colorscheme hybrid

set encoding=utf-8
set scrolloff=5
set sidescrolloff=5
set showmode
set hidden
set wildmode=list:longest
set wildignore+=*.pyc,*/tmp/*,*/target/*
set visualbell
set cursorline
set numberwidth=5
set ttyfast

set nowrap
set textwidth=80
set formatoptions+=qrn1

set list
set listchars=tab:▸\ ,eol:¬

let mapleader = ","

map <Leader>l :CtrlP<CR>
map <Leader>p :CtrlPBuffer<CR>
map <Leader>z :GundoToggle<CR>
map <Leader>s :Scratch<CR>
map <Leader>a :Ag  <BS>

map <Leader>rb :call RunCurrentSpecFile()<CR>
map <Leader>rf :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>

let g:gundo_preview_bottom = 1
let g:gundo_right = 1

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

let g:bold_parentheses = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:racer_cmd = $HOME . "/dev/racer/target/release/racer"
let $RUST_SRC_PATH=expand('~/dev/rust/src/')
let g:SuperTabDefaultCompletionType = "context"
