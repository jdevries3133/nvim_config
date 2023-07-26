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

## Forking

Are you thinking of forking this config? Check out [the forking
guide!](./FORKING.md)

## Background

Here are some highlights about myself and this config so that you can decide
whether my config is right for you:

- I try to ["grok vi"](https://stackoverflow.com/a/1220118)
  - I strive to use the things "included" with vim, and never intentionally
    overwrite built-in vim features with bad shortcuts
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

This plugin is a thoughtfully assembled and well-composed whole that just works.
Any bugs or rough spots are patched almost immediately because I'll see them,
feel the pain, and fix it.

As a downstream user, you'll get a config that is good and stays good, and
there's more than enough information for you to extend it to your liking, and
make it your own. In fact, you'll find that a majority of this code doesn't do
anything too opinionated. Most of it is just the boring stuff that you'd tear
your hair out trying to cobble together yourself.

## `FORKING.md`

This config is forkable by design! Look at [the forking guide.](./FORKING.md)

## `PLUGINS.md`

Take a look at this document. It's an index of all the plugins included in this
config, with some rationale for why they're here, how they interact with each
other, why they're important to my workflow, etc.

## Setup

> ⚠️ On startup, there will be a barrage of errors until you've completed each
> of these steps!

Git and a C compiler are required system prerequisites.

### Step 1: Clone this Repo

Clone this whole repository into `$HOME/.config/nvim`. It is important that you
clone this repository into that exact directory, since it's where neovim config
lives on your machine.

<details>
<summary>Caveat</summary>

Technically `$XDG_CONFIG_HOME/nvim` is where neovim config should be, which may
vary in location, especially on windows, which I know quite little about. On
unix-like systems, though, `$XDG_CONFIG_HOME` will be `$HOME/.config`.

I am wishy-washy about this throughout; i.e, in [init.lua](./init.lua), you can
see that the `plugins.vim` file is sourced. I do similar things in
[plugins.vim](./plugins.vim) and [the vim adapter
module](./lua/vim_config_adapter.lua)

</details>

```bash
mkdir -p $HOME/.config/nvim
git clone https://github.com/jdevries3133/nvim_config.git $HOME/.config/nvim
```

I strongly recommend you also fork the repository on GitHub. Start your own git
history, and then it will also be easy to accept new patches from my upstream,
or even to submit pull requests back to me!

### Step 2: Install the Package Manager, `vim-plugged`

Install [vim-plugged](https://github.com/junegunn/vim-plug) according to their
installation instructions. It's just a quick shell command to download a bit of
vim script.

Then, open neovim for the first time. **You'll see a bunch of errors on initial
startup, this is expected until plugins are installed.** Run `:PlugInstall` to
install all the plugins. After the process is complete, close and open neovim.
Now, you should expect no errors. If neovim is still sad, running `:PlugInstall`
again and restarting neovim is a good troubleshooting step. If you still have an
issue, try `:checkhealth` and see if neovim is disappointed in your computer. If
the cause of the issue remains unclear, open and issue or reach out to me, I'm
happy to help if I can!

### Step 3 (optional): Environment Variables

Some secrets and configuration options can be provided through environment
variables.

#### `$DEV_DB_URL`, `$PROD_DB_URL`

Connection strings for your "prod" and "dev" databases. Obviously, you might
have 1 database, 100 databases, who knows... it's very simple to break down this
dichotomy and configure `dadbod.vim` for as many databases as you need; see
`./lua/dadbod_conf.lua`.

#### `$NVIM_USE_EMMET_LS`

I have a love/hate relationship with Emmet language server. It's great if
you're writing tons of markup. It's super annoying if you're working in a React
codebase and also not creating a ton of UI, which is basically how most of my
JSX time is spent at work. So, I have an environment variable to configure
this.

#### `$NEOVIM_LIGHT`

When set, you'll get a light colorscheme. Sue me, I work outside sometimes!


#### `$GIT_REPO_BASE_URL`

This is used by my home-grown plugin. If you are using github or gitlab,
`:Gopen` will open up the current file in your web browser, which I use many
times every day to send a reference to part of the codebase to a colleague and
it might be one of my favorite things in this whole config.

It's a pretty naive plugin - it's sensitive to working directory, for example,
and I could think of easy improvements, so take a look at how it's actually
implemented before you try to use it, and feel free to submit upstream patches
or extract it out into a first-class plugin if you make it better!

## Maintenance

On an ongoing basis, you'll need to keep things updated. These are the typical
maintenance items:

- Make sure your neovim version itself stays up to date.
- Make sure you run `:PlugUpdate` to update all plugins often
- `:LspInstallInfo` will tell you about any out-of-date language servers and
  facilitate updating them
- `:TSUpdate` will update Treesitter parsers

# Any Issues?

Please open an issue if you have a problem. I do patch this config often, but
getting a new machine is pretty rare for me. Particularly for problems with
initial setup, please let me know by opening an issue!
