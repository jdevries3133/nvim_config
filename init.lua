------------------------- references to ~/.vim --------------------------------

--            these two source directives reference files
--            in ~/.vim. These files are not part of this
--            repository. Instead, they reference my vim
--            config, which you can see at
--            https://github.com/jdevries3133/vim_config

-- shared vim & neovim config. You can just copy the file here instead of
-- cloning my whole vim config too
-- https://github.com/jdevries3133/vim_config/blob/main/common.vim
vim.cmd("source $HOME/.vim/common.vim")

-- this is my home-grown snippet plugin. I would recommend just deleting this
-- and using one of the many popular open source snippet managers instead.
if (vim.fn.filereadable("$HOME/.vim/snippets.vim") == 1) then
  vim.cmd("source $HOME/.vim/snippets.vim")
end

-- causes files in thsi folder to be sourced later in the startup process. This
-- can cause bad interactions with certain vim plugins, but my vim config is
-- very minimal so there are no issues. I do have some stuff in this folder in
-- my vim config that gets picked up, like a `:Prettier` command for formatting
-- the current file, and extra aliases for fugitive.vim
vim.cmd("set runtimepath+=$HOME/.vim/after")


------------------------- config in this repository ---------------------------


-- ./plugins.vim contains all `Plug` directives for vim-plug
vim.cmd("source $XDG_CONFIG_HOME/nvim/plugins.vim")


require("neovim_conf") ------------------- general purpose neovim-specific
require("lsp_conf") ---------------------- languages server protocol
require("dap_conf") ---------------------- debugger adapter protocol
require("cmp_conf") ---------------------- neovim-cmp (completion suggestions)
require("treesitter") -------------------- treesitter and treesitter-context
require("gh") ---------------------------- github code review plugin
require("git_remote_open_file").setup() -- custom gitlab file opener
require("telescope_conf") ---------------- telescope is a pop-up search tool
require("statusline") -------------------- line at the bottom of the screen
require("catppuccin_conf") --------------- very configurable color scheme
require("dadbod_conf") ------------------- SQL client
