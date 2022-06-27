"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug First, install vim-plug by following the
" instructions at https://github.com/junegunn/vim-plug. Then, run :PlugInstall
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" general purpose
Plug 'MunifTanjim/prettier.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'dcampos/cmp-snippy'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'jremmen/vim-ripgrep'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'rcarriga/nvim-dap-ui'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'williamboman/nvim-lsp-installer'

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


""""""""""""""""""""""""""""" lsp-installer """""""""""""""""""""""""""""""""""
lua require("nvim-lsp-installer").setup {}


""""""""""""""""""""""""""""" telescope """""""""""""""""""""""""""""""""""""""
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tj <cmd>Telescope jumplist<cr>
nnoremap <leader>ts <cmd>Telescope lsp_workspace_symbols<cr>


lua <<EOF
require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}
EOF


""""""""""""""""""""""""""""" statusline """"""""""""""""""""""""""""""""""""""
lua << END

local function cwd()
    home = os.getenv("HOME")
    cwd = vim.loop.cwd()
    return cwd:gsub(home, "~")
end

require('lualine').setup {
    options = {
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'lsp_progress'},
        lualine_y = {'progress', 'filetype'},
        lualine_z = {
            'location',
            cwd
        }
    }
}
END
