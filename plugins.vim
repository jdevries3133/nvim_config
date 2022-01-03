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

" general purpose
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tommcdo/vim-fugitive-blame-ext'           " Git blame extension
Plug 'tpope/vim-commentary'                     " Comment anything out with 'gcc'
Plug 'tpope/vim-sensible'                       " a universal set of defaults
Plug 'tpope/vim-surround'                       " surrounding movements
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language support library
Plug 'nvim-telescope/telescope.nvim'            " project-wide search tool
Plug 'jremmen/vim-ripgrep'                      " ripgrep connector for telescope
Plug 'nvim-lua/plenary.nvim'                    " dependency of telescope and ripgrep

" treesitter parses ASTs and informs colorschemes and other plugins
Plug 'nvim-treesitter/nvim-treesitter', {
\   'do': ':TSUpdate'
\}

" colorschemens
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'


" javascript
Plug 'MaxMEllon/vim-jsx-pretty'

" python
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>


let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1


" augroup my_colours
"   autocmd!
"   autocmd ColorScheme sonokai hi SpellBad cterm=reverse
"   autocmd ColorScheme sonokai hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
" augroup END
set background=light
colorscheme PaperColor

