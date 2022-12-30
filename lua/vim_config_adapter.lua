-- Sourcing thingsn from my vim config. You don't need to install my vim config,
-- it'll be installed by vim-plug since it's included in ../plugins.vim.

local vim_config_dir = vim.fn.getenv("XDG_CONFIG_HOME") .. "/nvim/plugged/vim_config/"

vim.cmd("source " .. vim_config_dir .. "common.vim")
vim.cmd("source " .. vim_config_dir .. "snippets.vim")
print(vim_config_dir .. "after")
vim.opt.runtimepath:append(vim_config_dir .. "after")
