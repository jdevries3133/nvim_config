-- Note: all lua modules imported via `require()` are in the ./lua directory.
-- This is part of neovim's default behavior.

-- ./plugins.vim contains the plugin list for vim-plug, a package manager for
-- vim plugins
vim.cmd("source $XDG_CONFIG_HOME/nvim/plugins.vim")

require("neovim_conf") ------------------- general purpose neovim-specific
require("vim_config_adapter") ------------ sources stuff from vim config (~/.vim)
require("lsp_conf") ---------------------- languages server protocol
require("dap_conf") ---------------------- debugger adapter protocol
require("cmp_conf") ---------------------- neovim-cmp (completion suggestions)
require("treesitter") -------------------- language parser; try :TSPlaygroundToggle!
require("git_remote_open_file").setup() -- my own custom "gitlab file opener" plugin
require("gitsigns_conf") ----------------- git decorations, like sidebar colors
require("telescope_conf") ---------------- telescope is a pop-up search tool
require("statusline") -------------------- status line at the bottom of the UI
require("catppuccin_conf") --------------- very configurable color scheme
require("dadbod_conf") ------------------- SQL client
