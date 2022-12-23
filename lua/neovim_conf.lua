-- Native (non-plugin) config that is unique to neovim. Very little "vim-native"
-- config is in this repository because most of it is in `common.vim`, which
-- must be fetched separately since it's part of my vim config.

vim.g.colors_name = "catppuccin"
vim.opt.background = "dark"
vim.api.nvim_set_option('laststatus', 3)
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.cmd('nnoremap <leader>l :LspRestart<CR>')
