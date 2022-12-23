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

I don't care if you use my config or not, but I may as well explain where I'm
coming from so that you can understand if it might work for you. At the risk of
sounding a bit pushy, I want to address some common reservations for adopting
my config directly that I've heard, which I think are invalid:

> This is cheating

No it's not. There's a lot to learn here. It took me years, and now I've got
something good going. Why not start from a good place?

> I won't be able to navigate or change this

I don't think that's true. Documenting this config has been a very high
priority for me, right alongside making it work well. I share this with
coworkers, friends, enemies, and everyone in-between. If you can't navigate or
make changes to this config, I done goofed and I'd like to know about it; open
an issue!

> I just want to use AstroNvim or some other popular boilerplate

My only suggestion here is to point out that this config is much smaller and
simpler. It might be a clearer signal of how big your config should be for you
to become happy with your neovim experience, and as a config developed and used
by a single person, it might just be a better place for you to start forming
your own config.

The point of neovim isn't for it to "just work," but rather for it to become
akin to a grizzled mechanic's shop - morphing over time to suit the needs of
their workflow until a level of ergonomics incrementally emerges that could
never be engineered for a mass market.

> I have my own config that I already started

That's awesome! You can probably integrate what you have into this config
without too much trouble, and still get all the other benefits that this config
provides.

Lastly, here are some high-level highlights about this config:

- I try to ["grok vi"](https://stackoverflow.com/a/1220118)
  - I strive to use the things "included" with vim instead of building my own
    hacks
  - I understand what vim doesn't do, and use plugins as necessary to build out
    a rich development environment
- I am a web programmer who also dabbles in systems a bit; there is good
  support for all popular programming languages and development workflows
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

## Setup

> ⚠️ On startup, there will be a barrage of errors until you've completed all
> these steps

### Clone the Repo

Clone this whole repository into `~/.config/nvim`. This will only work if the
folder is currently empty, so move any existing config into a different
location for now, or delete it.

```bash
# note: $XDG_CONFIG_HOME is ~/.config on macOS / Linux machines
mkdir -p $XDG_CONFIG_HOME/nvim
git clone https://github.com/jdevries3133/nvim_config.git $XDG_CONFIG_HOME/nvim
```

### Create or Get `~/.vim/common.vim`

I have a `common.vim` file for shared config between vim and neovim, which is
part of my [vim config.](https://github.com/jdevries3133/vim_config) It is
sourced in `init.vim`, and thus a dependency of this setup. If you want to use
my `common.vim` file as well, you can grab it from github as follows:

```bash
mkdir -p $HOME/.vim
curl \
  -o $HOME/.vim/common.vim \
  https://raw.githubusercontent.com/jdevries3133/vim_config/main/common.vim
```

### vim-plugged

Install [vim-plugged](https://github.com/junegunn/vim-plug) according to their
installation instructions. It's just a quick shell command for your machine.

Then, open neovim for the first time. You'll see a bunch of errors on initial
startup, this is expected. Run the `:PlugInstall` to install all the plugins.
After the process is complete, close and open neovim. Now, you should expect no
errors.

### LSP & Treesitter

LSP stands for language support server. It provides intelligent code completion
suggestions, documentation on "hover" (pressing `K` in normal mode), etc. Run
`:LspInstallInfo` to see which LSPs you have installed, and which ones are
available. Install LSPs for the languages you use. There are more details in
`./lua/lsp_conf.lua`.

Treesitter parses languages to create an abstract syntax tree (AST). This
provides perfect syntax highlighting. View the available parsers with
`:TSInstallInfo`, and install the one(s) you want with `:TSInstall [parser]`
where `[parser]` is the name of one of the parsers in the info list. Try out
`:TSPlaygroundToggle` to explore ASTs of your code and confirm that Treesitter
is working. More details are in `./lua/treesitter.lua`.

## Colors

Ensure you are using a terminal with TrueColor support. On macOS, the default
"Terminal.app," does not. I prefer to use iTerm2 instead.

# Any Issues?

Please open an issue if you have a problem. I do patch this config often, but
getting a new machine is pretty rare for me. Particularly for problems with
initial setup, please let me know by opening an issue!
