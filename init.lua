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
vim.cmd("source $HOME/.vim/snippets.vim")


------------------------- config in this repository ---------------------------

-- ./plugins.vim contains all `Plug` directives for vim-plug
vim.cmd("source $HOME/.config/nvim/plugins.vim")


-- lua config modules. Sources of these files are in ./lua
require("neovim_conf") ----------------- general purpose neovim-specific
require("lsp_conf") -------------------- languages server protocol
require("dap_conf") -------------------- debugger adapter protocol
require("cmp_conf") -------------------- neovim-cmp (completion suggestions)
