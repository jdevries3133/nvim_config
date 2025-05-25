local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '$HOME/.config/nvim/plugged')

-- general purpose
Plug('arkav/lualine-lsp-progress')
Plug('dcampos/cmp-snippy')
Plug('dcampos/nvim-snippy')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/nvim-cmp')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('kyazdani42/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')
Plug('mfussenegger/nvim-dap')
Plug('mxsdev/nvim-dap-vscode-js')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-neotest/nvim-nio')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter-context')
Plug('nvim-treesitter/playground')
Plug('rcarriga/nvim-dap-ui')
Plug('samjwill/nvim-unception')
Plug('shortcuts/no-neck-pain.nvim', { ['tag'] = '*' })
Plug('tommcdo/vim-fugitive-blame-ext')
Plug('tpope/vim-commentary')
Plug('tpope/vim-dadbod')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-sensible')
Plug('tpope/vim-surround')
Plug('williamboman/mason-lspconfig.nvim', { ['tag'] = 'v1.32.0' })
Plug('williamboman/mason.nvim', { ['tag'] = 'v1.11.0' })
Plug('neovim/nvim-lspconfig')
Plug('wuelnerdotexe/vim-astro')

-- colorschemes
Plug('NLKNguyen/papercolor-theme')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('ellisonleao/gruvbox.nvim')
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('sainnhe/gruvbox-material')
Plug('sainnhe/sonokai')

-- language-specific plugins
Plug('Vimjas/vim-python-pep8-indent')
Plug('jvirtanen/vim-hcl')

-- my own vim config (non-neovim), which we'll borrow some config files from.
-- ./FORKING.md has some details about this quirk & what to do about it!
Plug('jdevries3133/vim_config')

vim.call('plug#end')