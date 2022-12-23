"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug: https://github.com/junegunn/vim-plug All plugin
" strings are references to GitHub repositories, and you should refer to the
" source repository for details about that plugin
"
" Configuration for all plugins when necessary is in the `lua` folder, where
" each plugin has a module with a similar name that contains its own config.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" general purpose
Plug 'arkav/lualine-lsp-progress'  " for example, this is https://github.com/arkav/lualine-lsp-progress
Plug 'dcampos/cmp-snippy'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'jremmen/vim-ripgrep'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mfussenegger/nvim-dap'
Plug 'mtdl9/vim-log-highlighting'
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
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'williamboman/nvim-lsp-installer'
if executable('gh')
    Plug 'ldelossa/litee.nvim'
    Plug 'ldelossa/gh.nvim'
endif

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

" language-specific plugins
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jvirtanen/vim-hcl'


call plug#end()




" TODO: this config is moving to lua soon too
" dadbod.vim (SQL Tool)
let g:dbs = {
\ 'dev': getenv('DEV_DB_URL'),
\ 'prod': getenv('PROD_DB_URL')
\ }
