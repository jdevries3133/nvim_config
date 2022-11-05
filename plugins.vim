"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug First, install vim-plug by following the
" instructions at https://github.com/junegunn/vim-plug. Then, run :PlugInstall
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" general purpose
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
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
Plug 'rcarriga/nvim-dap-ui'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'williamboman/nvim-lsp-installer'
Plug 'mtdl9/vim-log-highlighting'
if executable('gh')
    Plug 'ldelossa/litee.nvim'
    Plug 'ldelossa/gh.nvim'
endif

" colorschemes
Plug 'sainnhe/sonokai'                             " works on all terminals
Plug 'morhetz/gruvbox'                             " works on all terminals
Plug 'NLKNguyen/papercolor-theme'                  " works on all terminals
Plug 'sainnhe/gruvbox-material'                    " works on all terminals
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " works on all terminals
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }     " REQUIRES TrueColor; see README.md

" javascript
Plug 'MaxMEllon/vim-jsx-pretty'

" python
Plug 'Vimjas/vim-python-pep8-indent'

" hashicorp configuration language
Plug 'jvirtanen/vim-hcl'


call plug#end()


""""""""""""""""""""""""""""" telescope """""""""""""""""""""""""""""""""""""""

nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tj <cmd>Telescope jumplist<cr>
nnoremap <leader>ts <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>tc <cmd>Telescope git_commits<cr>
nnoremap <leader>tr <cmd>Telescope git_branches<cr>
nnoremap <leader>td <cmd>Telescope diagnostics<cr>


lua <<EOF
require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
    },
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
    theme = 'tokyonight',
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

let g:catppuccin_flavour = "mocha"

lua << EOF
require("catppuccin").setup({
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
    },
    color_overrides = {},
    custom_highlights = {},
})
EOF

" dadbod.vim (SQL Tool)
let g:dbs = {
\ 'dev': getenv('DEV_DB_URL'),
\ 'prod': getenv('PROD_DB_URL')
\ }
