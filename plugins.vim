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
Plug 'nvim-lualine/lualine.nvim'                " statusline
Plug 'kyazdani42/nvim-web-devicons'             " icons (for statusline, etc)


" treesitter parses ASTs and informs colorschemes and other plugins
Plug 'nvim-treesitter/nvim-treesitter', {
\   'do': ':TSUpdate'
\}

" colorschemens
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/gruvbox-material'


" javascript
Plug 'MaxMEllon/vim-jsx-pretty'


" python
Plug 'Vimjas/vim-python-pep8-indent'

" hashicorp configuration language syntax highlighting
Plug 'jvirtanen/vim-hcl'


call plug#end()


" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>


" Seeing the hidden files is good, but idk why the ignore pattern
" DOESN'T FUCKING WORK
lua <<EOF
require('telescope').setup {
    file_ignore_patterns = {"^%.git/"},
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
EOF

lua << END
require('lualine').setup {
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'g:coc_status'},
    lualine_y = {'progress', 'filetype'},
    lualine_z = {'location',}
  }
}
END
