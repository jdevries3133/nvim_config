vim.cmd("source $HOME/.vim/common.vim")
vim.cmd("source $HOME/.vim/snippets.vim")
vim.cmd("source $HOME/.config/nvim/plugins.vim")

require("neovim")
require("lsp")
require("dap_conf")
require("completion")
