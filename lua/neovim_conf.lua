-- native config that is unique to neovim.

-- previous was `PaperColor` if this doesn't work out
vim.g.colors_name = "PaperColor"


vim.opt.background = "dark"
vim.api.nvim_set_option('laststatus', 3)
vim.opt.showmode = false
vim.opt.signcolumn = "yes"