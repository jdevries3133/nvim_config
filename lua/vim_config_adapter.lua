-- Sourcing things from my vim config. You don't need to install my vim config,
-- it'll be installed by vim-plug since it's included in ../plugins.vim.
-- There are some details about this quirk in ../FORKING.md

local vim_config_dir = vim.fn.getenv("HOME") .. "/.config/nvim/plugged/vim_config/"

vim.cmd("source " .. vim_config_dir .. "common.vim")
vim.cmd("source " .. vim_config_dir .. "snippets.vim")
vim.opt.runtimepath:append(vim_config_dir .. "after")
