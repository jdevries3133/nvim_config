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
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'


" treesitter parses ASTs and informs colorschemes and other plugins
Plug 'nvim-treesitter/nvim-treesitter', {
\   'do': ':TSUpdate'
\}

" colorschemes
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/gruvbox-material'

" javascript
Plug 'MaxMEllon/vim-jsx-pretty'

" python
Plug 'Vimjas/vim-python-pep8-indent'

" hashicorp configuration language
Plug 'jvirtanen/vim-hcl'

call plug#end()


lua require("nvim-lsp-installer").setup {}


" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>


lua <<EOF
require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
EOF

lua << END

local function cwd()
    home = os.getenv("HOME")
    cwd = vim.loop.cwd()
    return cwd:gsub(home, "~")
end

require('lualine').setup {
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'g:coc_status'},
    lualine_y = {'progress', 'filetype'},
    lualine_z = {
        'location',
        cwd
    }
  }
}
END
