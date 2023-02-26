"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins managed by vim-plug: https://github.com/junegunn/vim-plug All plugin
" strings are references to GitHub repositories, and you should refer to the
" source repository for details about that plugin
"
" Configuration for all plugins when necessary is in the `lua` folder, where
" each plugin has a module with a similar name that contains its own config.
"
" See ./PLUGINS.md for notes on each plugin, what it does, & why it's here.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

" general purpose
Plug 'arkav/lualine-lsp-progress'  " for example, this is https://github.com/arkav/lualine-lsp-progress
Plug 'dcampos/cmp-snippy'
Plug 'dcampos/nvim-snippy'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mxsdev/nvim-dap-vscode-js'
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
Plug 'vmchale/just-vim'
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
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jvirtanen/vim-hcl'

" my own vim config (non-neovim), which we'll borrow some config files from,
" see ./lua/vim_config_adapter.lua
Plug 'jdevries3133/vim_config'


call plug#end()
