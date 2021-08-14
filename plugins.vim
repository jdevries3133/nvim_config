"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" All that follows are plugins. They are managed by vim-plug, a package
" manager for vim plugins. To quickly setup vim on a remote machine, only
" copy everything above.
"
" For your local machine, first install vim-plug by following the instructions
" at https://github.com/junegunn/vim-plug. Then, after launching vim, run
" :PlugInstall
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
                            " GENERAL PURPOSE
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tpope/vim-commentary'                     " Comment anything out with gcc
Plug 'tpope/vim-sensible'                       " a universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-surround'                       " surrounding movements
Plug 'tommcdo/vim-fugitive-blame-ext'           " Git blame extension
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelligent auto-complete
Plug 'fweep/vim-zsh-path-completion'            " ZSH-like file path completion
cmap <S-Tab> <Plug>ZshPathComplete

                            " PYTHON
Plug 'Vimjas/vim-python-pep8-indent'            " pep8 indenting
Plug 'vim-python/python-syntax'                 " syntax highlighting
let g:python_highlight_all = 1

                            " JAVASCRIPT & TYPESCRIPT
Plug 'yuezk/vim-js'                             " Syntax highlighting
Plug 'MaxMEllon/vim-jsx-pretty'                 " JSX syntax highlighting
Plug 'leafgarland/typescript-vim'               " Typescript
Plug 'peitalin/vim-jsx-typescript'              " TSX (JSX in Typescript)

                            " C
Plug 'NLKNguyen/c-syntax.vim'

call plug#end()


" Aliases for git-fugitive commands
command! -nargs=0 Ga :Git add -A
command! -nargs=0 Gc :Git commit -v
command! -nargs=0 Gd :Git diff
command! -nargs=0 Gp :Git push
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdqf :Git difftool
