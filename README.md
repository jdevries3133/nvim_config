# My `nvim` Config

This is my personal neovim configuration. There are many like it, but this one
is mine. In fact, there are a few that are _very much like it!_ I try my best
to keep this config exceptionally clear and well-documented so that I can share
it with those who are looking to get started with neovim, and it can ultimately
live many lives as downstream forks.

If you're new to vim entirely, I have a [series of blog
posts](https://jackdevries.com/post/vimTutorial) just for you! The most
important TL;DR is to start by learning the vim editing shortcuts by using a
vim plugin for your current editor, so go do that now if you haven't already!

## Background

Here are some highlights about myself and this config so that you can decide
whether my config is right for you:

- I try to ["grok vi"](https://stackoverflow.com/a/1220118)
  - I strive to use the things "included" with vim instead of building my own
    hacks
  - I understand what vim doesn't do, and use plugins as necessary to build out
    a rich development environment
- I am a web programmer who also dabbles in systems a bit; there is good
  support for many popular programming languages and development workflows
- All source code here is very well documented, and opinionated decisions are
  explained
- I have been using vim for about 3 years, and this config has organically
  grown over that time
- I use this config all day every day at work - it's battle tested and
  continuously improving

In sum, this isn't a quick slew of trendy plugins thrown together for a YouTube
tutorial. It's a well-composed whole that works. Any bugs or rough spots are
patched almost immediately because I'll see them, feel the pain, and fix it.

As a downstream user, you'll get a config that is good and stays good, and
there's more than enough information for you to extend it to your liking, and
make it your own. In fact, you'll find that a majority of this code doesn't do
anything too opinionated. Most of it is just the boring stuff that you'd tear
your hair out trying to cobble together.

## `PLUGINS.md`

Take a look at this document. It's an index of all the plugins included in this
config, with some rationale for why they're here, how they interact with each
other, why they're important to my workflow, etc.

## Setup

> ⚠️ On startup, there will be a barrage of errors until you've completed all
> these steps!

### Clone the Repo

Clone this whole repository into `~/.config/nvim`. This will only work if the
folder is currently empty, so move any existing config into a different
location for now.

```bash
mkdir -p $XDG_CONFIG_HOME/nvim
git clone https://github.com/jdevries3133/nvim_config.git $XDG_CONFIG_HOME/nvim
```

### vim-plugged

Install [vim-plugged](https://github.com/junegunn/vim-plug) according to their
installation instructions. It's just a quick shell command for your machine.

Then, open neovim for the first time. You'll see a bunch of errors on initial
startup, this is expected. Run the `:PlugInstall` to install all the plugins.
After the process is complete, close and open neovim. Now, you should expect no
errors. If there are still issues, try `:PlugInstall` a second time; I've
noticed that there are sometimes race conditions with plugins that depend on
each other being installed in the wrong order during initial setup, which is
why you might need to install more than once to get everything into a healthy
state. In the future, you can update plugins with `:PlugUpdate`, which you
should do regularly. If you update and have an issue, pull from upstream; maybe
I fixed it! If not, open an issue on the repo, I'd love to know about it and
fix it!

### LSP & Treesitter

LSP stands for language support server. It provides intelligent code completion
suggestions, documentation on "hover" (pressing `K` in normal mode), etc. Run
`:LspInstallInfo` to see which LSPs you have installed, and which ones are
available. Install LSPs for the languages you use. There are more details in
`./lua/lsp_conf.lua`.

Treesitter parses languages to create an abstract syntax tree (AST). This
provides perfect syntax highlighting. Per this config, the following languages
are installed by default:

- `c`
- `vimscript`
- `lua`
- `rust`
- `javascript`
- `typescript`
- `bash`
- `git` (`.gitignore`, `GIT_COMMIT`, etc.)
- `diff` ()

You can add more for the languages you use by including them in the
`ensure_installed` table inside `./lua/treesitter.lua`. View `:TSInstallInfo`
to get the exact names of all the parsers that are available.

## Colors

Ensure you are using a terminal with TrueColor support. On macOS, the default
"Terminal.app," does not. I prefer to use iTerm2 instead.

## Maintenance

All of these manual plugin steps are generally followed by manual updates!

- Make sure your neovim version itself stays up to date.
- Make sure you run `:PlugUpdate` to update all plugins often
- `:LspInstallInfo` will tell you about any out-of-date language servers so you
  can keep those updated
- `:TSUpdate` will update Treesitter parsers

# Any Issues?

Please open an issue if you have a problem. I do patch this config often, but
getting a new machine is pretty rare for me. Particularly for problems with
initial setup, please let me know by opening an issue!
