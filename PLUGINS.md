# Rationale

TODO

# Plugin Index

## `arkav/lualine-lsp-progress`

This just throws the output from the LSP server into the status bar so you can
see if it's starting up, indexing, etc. Helpful when you open up a big project,
because the LSP will typically be unresponsive for a few seconds while it gets
its act together, and you'll see output in the status bar during this time.

## `dcampos/cmp-snippy`

This is an adapter to connect `nvim-snippy` to `cmp-nvim` so it can provide
completion suggestions.

## `dcampos/nvim-snippy`

For whatever reason, nvim-cmp, the thing that provides completion suggestions,
_requires_ a snippet provider. I chose this one. I'm actually surprised that it
does provide quite a few useful snippets like HTML boilerplate, license
headers, etc.

It's also extendable but I'm not really a big snippet user.

I also know that [luasnip](https://github.com/L3MON4D3/LuaSnip) seems like the
trendier snippet plugin as of writing, so you might want to swap cmp-snippy out
for luasnip if you're a snippet lover.

## `hrsh7th/cmp-buffer`

This looks at the file you're in, looks at the other words in the file, and
uses that set of words as a completion source. This actually comes in handy
more than you'd think, for example if you're writing some technical document
and the same long keyword keeps coming up over and over again.

## `hrsh7th/cmp-nvim-lsp`

This is the plugin that queries the languages support server for code
completion suggestions, which ultimately provide the most meaningful
suggestions when editing code, which is why these suggestions get top priority
in `./lua/cmp_conf.lua`

## `hrsh7th/cmp-nvim-lsp-signature-help`

This is a fairly recent addition, it shoes function signature information when
you type the opening parenthesis to a function call just like VS Code.

I was missing this for a long, long time and it drove me truly insane.

## `hrsh7th/cmp-path`

This is actually amazing, it provides completion suggestions for paths anytime
you start typing something that looks like a file path. So if you type `/`, it
will immediately show you the directories at the root of your machine. `./`, or
`../../` will similarly provide path completion suggestions from your current
file.

Super helpful for imports in javascript / typescript.

## `hrsh7th/nvim-cmp`

This is the completion provider plugin which provides the UI of completion
suggestions, and is configured to call out to the previous plugins for
completion suggestions.

## `kristijanhusak/vim-dadbod-ui`

This provides a UI for `tpope/dadbod.vim`, which is a SQL client for vim. Very,
very, very nice if you work with SQL. You need to provide connection strings as
environment variables to get this to work; `DEV_DB_URL`, and `PROD_DB_URL`.
Once provided, you can open the UI with `:DBUI`.

You can save useful queries, have multiple buffers for composing queries open,
queries will execute on save, which causes a nice results buffer to open up.
The results buffer is an infinitely wide non-wrapping vim buffer, so you can
actually view very wide tables without it becoming incomprehensible spaghetti.

Overall 10/10 if you do any SQL.

## `kyazdani42/nvim-web-devicons`

This works together with a so-called ["nerd
font,"](https://github.com/ryanoasis/nerd-fonts) to put icons all over the
place, including in the status line and inside telescope when searching for
things.

## `mfussenegger/nvim-dap`

This is an implementation of the debugger adapter protocol for neovim. It is
cursed and fraught, see `./lua/dap_conf.lua` for details, and good luck!

## `mtdl9/vim-log-highlighting`

Nice syntax highlighting for logs. It is regex-based, so it's not super
performant. That being said, the author did write the regexes smartly enough
that they are performant enough.

Overall, just some nice syntax highlighting for log files.

## `neovim/nvim-lspconfig`

This plugin provides a lot of the boilerplate that would be needed to get
various language support servers to work. You will see it used in
`./lua/lsp_conf.lua` to bootstrap many language support servers.

## `nvim-lua/plenary.nvim`

This provides a lua library for asynchronous coroutines. It's a dependency of
various other plugins.

## `nvim-lualine/lualine.nvim`

This provides the status line at the bottom. It is highly-configurable, and
configured in `./lua/statusline.lua`, and there are more details about the
plugin there.

## `nvim-telescope/telescope.nvim`

This is the "search for stuff in a popup," plugin. It does a lot; see
`./lua/telescope_conf.lua`.

## `nvim-treesitter/nvim-treesitter`

AST parser plugin, mainly used by colorschemes for good syntax highlighting.
See `./lua/treesitter.lua`.

## `nvim-treesitter/nvim-treesitter-context`

This uses treesitter to provide a sticky header which shows the enclosing
class, method, function, etc. for the block your cursor is currently in.

## `nvim-treesitter/playground`

Provides a treesitter playground which you can toggle on with
`:TSPlaygroundToggle`. This is super cool just to visualize how your code is
parsed, but also super useful if you need to debug treesitter itself.

## `rcarriga/nvim-dap-ui`

Provides a UI for the debugger adapter protocol inside neovim. This plugin is
actually fantastic, but as mentioned before `nvim-dap` itself is cursed, and
the debugger adapters themselves are quite janky. Details are in
`./lua/dap_conf.lua`, and good luck debugging; it's been a wild ride.

## `tommcdo/vim-fugitive-blame-ext`

Provides interactive `:Git blame` which integrates with vim-fugitive.

## `tpope/vim-commentary`

Allows you to comment things our with the `gc` action in normal mode.

## `tpope/vim-dadbod`

Dadbod.vim is a SQL client for vim. Set `DEV_DB_URL` and `PROD_DB_URL` for your
database to make it work, or take a look at `lua/dadbod_conf.lua` to revise the
config to meet your needs.

## `tpope/vim-fugitive`

vim-fugitive is a fantastic git plugin. See its own documentation for how to
use it.

## `tpope/vim-sensible`

This is just a set of sensible defaults for vim according to tpope, a true vim
wizard.

## `tpope/vim-surround`

This gives you a new motion `s` for "surrounding." It allows you to change and
delete surrounding text objects, like quotation marks, parenthesis, curly
braces, etc. For example:

| Starting Text | Normal-Mode Command | Verbal Interpretation           | Ending Text |
| ------------- | ------------------- | ------------------------------- | ----------- |
| `'value'`     | `ds'`               | delete surrounding single quote | `value`     |
| `({ value })` | `ds{`               | delete surrounding curly brace  | `(value)`   |
| `(value)`     | `cs({`              | change surrounding `(` to `{`   | `{value}`   |
| `'value'`     | `cs'"`              | change surrounding `'` to `"`   | `"value"`   |

This is clearly quite useful and extensible.

## `williamboman/nvim-lsp-installer`

This is a package manager for language support servers. Open it up with
`:LspInstallInfo`, it makes it very easy to get LSP servers installed and keep
them up to date.

## `ldelossa/litee.nvim`

This is a UI framework from the guy who wrote `gh.nvim`, and it's a dependency.

## `ldelossa/gh.nvim`

This is a plugin for doing github code reviews inside neovim. I only have it
installed on my personal machine because I use GitLab at work. Moreover, this
plugin will complain if the github CLI isn't installed on your machine.

Although quite janky and buggy (this was just a quick hobby project for
somebody), it's super nice to be able to do code reviews inside vim with
language support, goto definition, etc.

## `NLKNguyen/papercolor-theme`

Just a color theme enable it with `:colorscheme PaperColor`.

## `catppuccin/nvim`

Just a color theme this is the default (already enabled). It's also much more
configurable than the others, so config is in `lua/catppuccin_conf.lua`.

## `ellisonleao/gruvbox.nvim`

Just a color theme enable it with `:colorscheme gruvbox`.

## `folke/tokyonight.nvim`

Just a color theme enable it with `:colorscheme tokyonight` (and there are many
variations like `tokyonight-day`).

## `sainnhe/gruvbox-material`

Just a color theme enable it with `:colorscheme gruvbox-material`.

## `sainnhe/sonokai`

Just a color theme enable it with `:colorscheme sonokai`.

## `Vimjas/vim-python-pep8-indent`

Indent rules for python, because by default vim only understands C-like
languages and will do wild things when writing python code.

## `jvirtanen/vim-hcl`

Syntax highlighting for HashiCorp Configuration Language (HCL), which is used
by [Terraform](https://www.terraform.io/).
