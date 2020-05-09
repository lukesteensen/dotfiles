if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'fatih/vim-go'
Plug 'sjl/gundo.vim'
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'cstrahan/vim-capnp'
Plug 'rust-lang/rust.vim'
Plug 'nono/vim-handlebars'
Plug 'jremmen/vim-ripgrep'
Plug 'mitsuhiko/vim-jinja'
Plug 'thoughtbot/vim-rspec'
Plug 'pforman/vim-terraform'
Plug 'chase/vim-ansible-yaml'
Plug 'junegunn/limelight.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ekalinin/Dockerfile.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/IndexedSearch'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'lifepillar/vim-mucomplete'

" Colors
Plug 'w0ng/vim-hybrid'

call plug#end()

" Don't litter working directory with swp and backup files
" TODO: create this dir if it doesn't exist
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

let mapleader = "\\"

map <Leader>z :GundoToggle<CR>

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

let g:airline_powerline_fonts = 1

" erb surrounds outside rails
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"

let g:bold_parentheses = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:NERDSpaceDelims=1

let g:rustfmt_autosave = 1
let g:go_fmt_command = "goimports"

let $FZF_DEFAULT_OPTS = '--reverse'
let $FZF_DEFAULT_COMMAND = 'fd --type f'
map <silent> <leader>ff :Files<CR>
map <silent> <leader>fb :Buffers<CR>
map <silent> <leader>ft :Tags<CR>

" new rust-analyzer lsp stuff from here down
let g:LanguageClient_serverCommands = { 'rust': ['ra_lsp_server'] }

set signcolumn=yes

function SetLSPShortcuts()
  " nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  " nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  " nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  " nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  " nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  " nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  " nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  " nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
  set omnifunc=LanguageClient#textDocument_completion()
endfunction()


filetype plugin on
augroup LSP
  autocmd!
  autocmd FileType rust call SetLSPShortcuts()
augroup END

set completeopt+=menuone
set completeopt+=noselect
set completeopt-=preview
