" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

" No need to maintain vi compatibility
set nocompatible

" Don't litter working directory with swp and backup files
set backupdir=~/.vim/temp,.
set directory=~/.vim/temp,.

set autoindent
set smartindent

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
"set hlsearch
"map <leader><space> :noh<CR>

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

set clipboard=unnamed

"set wrap
set textwidth=80
set formatoptions=qrn1

set list
set listchars=tab:▸\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let Tlist_Use_Right_Window = 1
let NERDTreeWinSize = 40

let mapleader = ","

map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :TlistToggle<CR>
map <Leader>l :CommandT<CR>
map <Leader>f :CommandTFlush<CR>
map <Leader>z :GundoToggle<CR>
map <Leader>s :Scratch<CR>
map <Leader>a :Ack 
map <Leader>j :cn<CR>
map <Leader>k :cp<CR>
map <Leader>. :<up><CR>
map <Leader>m :MiniBufExplorer<CR>
map <Leader>rt :!ctags --extra=+f -R *<CR>

let g:CommandTMaxHeight=20
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 0

autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nnoremap <Leader>vv :e $MYVIMRC<CR>
nnoremap <Leader>gg :e $MYGVIMRC<CR>
nnoremap <Leader>ss :source $MYVIMRC<Bar>:source $MYGVIMRC<CR>

