# Overview & Rationale

I consider my plugin choices pretty minimal and conservative. Because these are
well-maintained and extremely popular plugins in the community, they do not
break; full stop. I know a common neovim complaint is that the plugins can be
more volatile and chaotic, and to be sure, there are plenty of volatile and
chaotic plugins an any software ecosystem, but I personally run `:PlugUpdate`
all the time and very rarely have any issues. Plus, this config is constantly
evolving, so abandoned plugins get cycled out and new ones get cycled in all
the time.

# Plugin Overview

## `jdevries3133/vim_config`

Maybe this is the most important bit to understand!! My own vim config is a
dependency of this config. In `./lua/vim_config_adapter.lua` you'll notice that
the `common.vim` file from my vim config, the snippets module, and all the
"after" scripts (which setup custom git-fugitive aliases) are called from this
config.

This is a bit untraditional, but it's been the most easy and reliable way to
keep my vim and neovim configs in sync with each other without any weird
out-of-band assumptions which would harm the portability and ease-of-adoption
of this config.

Nonetheless, you may not wish to subscribe to _surprise backdoor by Jack_, and
I don't think you should! [The forking guide](./FORKING.md) has details for what
to do about this!

## `arkav/lualine-lsp-progress`

This just throws the output from the LSP server into the status bar so you can
see if it's starting up, indexing, etc. Helpful when you open up a big project,
because the LSP will typically be unresponsive for a few seconds while it gets
its act together, and you'll see output in the status bar during this time.

## `dcampos/cmp-snippy`

This is an adapter to integrate `nvim-snippy` to `cmp-nvim` so it can provide
completion suggestions.

## `dcampos/nvim-snippy`

For whatever reason, `nvim-cmp`, the thing that provides completion
suggestions, _requires_ a snippet provider. I chose this one. I'm actually
surprised that it does provide quite a few useful snippets like HTML
boilerplate, license headers, etc.

It's also extendable but I'm not really a big snippet user. I have my own
[custom snippet
thing](https://github.com/jdevries3133/vim_config/blob/main/snippets.vim) which
is good enough for me, although jank enough compared to real snippet plugins
that I'd not advise others to use it!

I also know that [luasnip](https://github.com/L3MON4D3/LuaSnip) seems like the
trendier snippet plugin as of writing, so you might want to swap `cmp-snippy`
out for `luasnip` if you're a heavy snippet user.

## `hrsh7th/cmp-buffer`

This looks at the file you're in, looks at the other words in the file, and
uses that set of words as a completion source.

## `hrsh7th/cmp-nvim-lsp`

This is the plugin that queries the languages support server for code
completion suggestions, which ultimately provide the most meaningful
suggestions when editing code, which is why these suggestions get top priority
in `./lua/cmp_conf.lua`

## `hrsh7th/cmp-nvim-lsp-signature-help`

This is a fairly recent addition, it shows function signature information when
you type the opening parenthesis to a function call just like VS Code.

I was missing this for a long, long time and it drove me truly insane and I am
so happy that I finally figured out how to make neovim do it!

## `hrsh7th/cmp-path`

Another completion plugin; this provides completion suggestions for file paths
anytime you start typing something that looks like a file path. So if you type
`/`, it will immediately show you the directories at the root of your machine.
`./`, or `../../` will similarly provide path completion suggestions relative
to the file you're currently editing.

Super helpful for imports in JavaScript / TypeScript.

## `hrsh7th/nvim-cmp`

This is the completion plugin which provides the completion UI and framework
in which all of the above completion suggestions exist.

## `kristijanhusak/vim-dadbod-ui`

This provides a UI for `tpope/dadbod.vim`, which is a SQL client for vim. Very,
very, very nice if you work with SQL. You need to provide connection strings as
environment variables to get this to work; `DEV_DB_URL`, and `PROD_DB_URL`.
Once provided, you can open the UI with `<leader>db` or `:DBUI`.

Overall 11/10 if you do any SQL. As a pro-tip: your saved queries will go into
a directory on your machine. If you find that directory and make it into a git
repository, you'll get version control for your saved queries, and it'll
seamlessly integrate with `tpope/vim-fugitive`.

## `kyazdani42/nvim-web-devicons`

This works together with a so-called ["nerd
font,"](https://github.com/ryanoasis/nerd-fonts) to put icons all over the
place, including in the status line and inside telescope when searching for
things.

You will need to install one of these special fonts on your machine and
configure your terminal to use that font for this plugin to work.

## `lewis6991/gitsigns.nvim`

This decorates the sidebar based on git changes.

## `mfussenegger/nvim-dap`

This is an implementation of the debugger adapter protocol for neovim. It took
a lot of work for me to figure out how to get this thing to work right, but the
investment was very worth it. If you look in `./lua/dap_conf.lua`, I go deep on
configuring it. I have had the most success in JavaScript/TypeScript and Python
environments, and to a lesser extent with Rust / C.

The greatest revelation here is that you can evaluate a selection in the
debugger context by highlighting some source code in visual mode and using the
shortcut `<space>v`. So, you can highlight a symbol, hit `<space>v`, and see
the value. However, you can _also_ highlight an expression or function call,
and you can even tinker with the code inline and `<space>v` some new source
code which will be evaluated. You can also press `<space>v`, in normal mode to
open up a floating window where you can browse all values in scope.

Another favorite feature is jumping through the evaluation stack. A pretty
basic debugger feature, but being able to do it in neovim is just so enjoyable.

I cannot express how nice it is to be able to debug, edit, and inspect code all
at the same time and all inside neovim.

# `mxsdev/nvim-dap-vscode-js`

Adapter to connect `nvim-dap` with `vscode-js-debug`. `vscode-js-debug` is the
DAP (debugger) server for Node.js. This is the same technology that is used
under the hood by VS Code, so it works... well, I wouldn't say great, but
exactly as good as VS Code!

## `nvim-lua/plenary.nvim`

This provides a lua library for asynchronous coroutines. It's a dependency of
various other plugins.

## `nvim-lualine/lualine.nvim`

This provides the status line at the bottom. It is highly-configurable, and
configured in `./lua/statusline.lua`.

## `nvim-neotest/nvim-nio`

This is a dependency of `nvim-dap-ui`.

## `nvim-telescope/telescope.nvim`

This is the "search for stuff in a popup," plugin. It does a lot; see
`./lua/telescope_conf.lua`.

You can easily discover the many, many things Telescope can search through by
just typing `:Telescope <tab>` in the command line and perusing all the
completion options that appear.

## `nvim-treesitter/nvim-treesitter`

AST parser plugin, whose main purpose is to facilitate syntax highlighting. By
default, vim uses fairly naive regular expressions for syntax highlighting,
which are mind-bogglingly slow for large files.

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
excellent, and very configurable. See `./lua/dap_conf.lua`.

## `shortcuts/no-neck-pain.nvim`

A problem: when I am focusing on just one file, vim shoves it to the left side
of my screen, and I'm looking slightly to the left for hours at a time. Ouch --
neck pain ensues.

With this plugin, you can just use the shortcut `<leader>nn`, and the text
buffer(s) you have open will be centered. `<leader>nn` performs a toggling
action, so you can run it again to re-center.

## `tommcdo/vim-fugitive-blame-ext`

Provides interactive `:Git blame` which integrates with vim-fugitive. For
example, try pressing `<enter>` over a git hash, you will leap into vim
fugitive exploration.

## `tpope/vim-commentary`

Allows you to comment things out / in with the `gc` action in normal mode. For
example `gcc` to comment-out (or in) the current line, or `gca{` to comment out
everything around the curly braces your cursor is currently inside of.

## `tpope/vim-dadbod`

`Dadbod.vim` is a SQL client for vim.

Take a look at `lua/dadbod_conf.lua` to see how its setup. You are going to
need to pass database connection URLs into dadbod to enable it to make
connections, which you can see I do through environment variables since you
obviously want to take great care to keep that out of version control.

## `tpope/vim-fugitive`

`vim-fugitive` is a fantastic git plugin. See its own documentation for how to
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

## `williamboman/mason.nvim`

Language server protocol (package manager).

## `williamboman/mason-lspconfig.nvim`

Language server protocol (configuration framework).

## `wuelnerdotexe/vim-astro`

Provides syntax highlighting for Astro files. If you use Astro, there is also
an Astro LSP you can install with `nvim-lsp-installer`.

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
