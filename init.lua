-- Note: all lua modules imported via `require()` are in the ./lua directory.
-- This is part of neovim's default behavior.

----------------------------- native config -----------------------------------

require("neovim_conf") ------------------- general purpose neovim-specific
require("vim_config_adapter") ------------ sources stuff from vim config (~/.vim)

----------------------------- plugin config -----------------------------------

-- ./plugins.vim contains all `Plug` directives for vim-plug
vim.cmd("source $XDG_CONFIG_HOME/nvim/plugins.vim")

require("lsp_conf") ---------------------- languages server protocol
require("dap_conf") ---------------------- debugger adapter protocol
require("cmp_conf") ---------------------- neovim-cmp (completion suggestions)
require("treesitter") -------------------- language parser; try :TSPlaygroundToggle!
require("gh") ---------------------------- github code review plugin
require("git_remote_open_file").setup() -- my own custom "gitlab file opener" plugin
require("telescope_conf") ---------------- telescope is a pop-up search tool
require("statusline") -------------------- status line at the bottom of the UI
require("catppuccin_conf") --------------- very configurable color scheme
require("dadbod_conf") ------------------- SQL client
