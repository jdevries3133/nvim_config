-- This handles sourcing things from ~/.vim, which is hypothesized to be my own
-- vim config, which you can find here: https://github.com/jdevries3133/vim_config
--
-- If my vim config isn't present, that's (mostly) OK! Check the top-level
-- README for setup directions


-- shared vim & neovim config. You can just copy the file here instead of
-- cloning my whole vim config too
-- https://github.com/jdevries3133/vim_config/blob/main/common.vim
vim.cmd("source $HOME/.vim/common.vim")

-- this is my home-grown snippet plugin. I would recommend just deleting this
-- and using one of the many popular open source snippet managers instead.
if (vim.fn.filereadable("$HOME/.vim/snippets.vim") == 1) then
  vim.cmd("source $HOME/.vim/snippets.vim")
end

vim.cmd("set runtimepath+=$HOME/.vim/after")
