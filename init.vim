" My Essentials
tnoremap jk <C-\><C-n>
inoremap jk <Esc>
" Ctrl + HJKL to move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c
command Mtags !rm tags && ctags -R .

colorscheme Tomorrow-Night
" Uncomment next 2 lines to cycle through all colorschemes with F8
" source ./setcolors.vim
" SetColors all

set nowrap
set showmode
set showcmd
set title
set number
set hidden
" This is what files look like
set ffs=unix,dos,mac
" Update find path to search subdirectories
set path=$PWD/**
" No backups
set nobackup
set nowritebackup
set nowb
set noswapfile
" Keep lots of history/undo
set undolevels=1000
" Files to ignore
" Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Erlang
set wildignore+=*.beam
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar
set wildmenu
" Javascript/Node
set wildignore+=node_modules/*

set t_Co=256
set colorcolumn=80,100

" Tab sanity
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·
" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab



set exrc
set secure
call plug#begin()
Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'sentientmachine/Pretty-Vim-Python'
" JavaScript
Plug 'jelera/vim-javascript-syntax'
" CSS and SCSS
Plug 'cakebaker/scss-syntax.vim'
" Asynchronous Lint Engine
Plug 'dense-analysis/ale'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

let g:ale_set_highlights = 0
let b:ale_fixers = {
\    'javascript': ['prettier'],
\    'python': ['autopep8'],
\}
let g:ale_linters = {'javascript': 'eslint', 'python': ['pylint']}
let g:ale_fix_on_save = 1

highlight Comment cterm=bold

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.o$,\.obj$,'
let g:netrw_list_hide .= '\.a$,\.so$,\.lib$,\.dll$,'
let g:netrw_list_hide .= '\.pyc\s\+,'
let g:netrw_list_hide .= '\.o\s\+,\.obj\s\+,'

" replace error bell with visual bell
set noerrorbells visualbell t_vb=
noremap ' `
noremap ` '

" turn hybrid line numbers on
set number relativenumber
set nu rnu

