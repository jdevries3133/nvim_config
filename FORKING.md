# What the Fork?

I am actively working to make this config as fork-friendly as possible. While
you can just click "fork" on GitHub and go full send, there are some things you
might want to consider!

## Vim Config

My [vim config](https://github.com/jdevries3133/vim_config) is a dependency of
this config. In particular, this [common.vim
file](https://github.com/jdevries3133/vim_config/blob/main/common.vim) has many
of the key mappings that are _most_ personal to me, like mapping `jk` to
`<Esc>`, among others. Naturally, this might be the #1 quirk you'd want to
address first of all.

Look at `./plugins.vim` in this config. `Plug 'jdevries3133/vim_config'` is
listed like any other vim plugin! Then, pieces of it are explicitly loaded in
`./lua/vim_config_adapter.lua`.

So, my best suggestion is to fork my vim config too! My vim config is _much_
smaller than my neovim config. You will probably want to toss out that top
section of the `common.vim` file where my most opinionated configurations are
applied. You don't need to actually install or configure this repository, it
will get pulled in by neovim like any other plugin when you just run
`:PlugInstall`.

## Shortcuts

All the custom shortcuts I've defined have been factored into one place to make
them easy to find, change, or disable; see `./lua/shortcuts.lua`.

## Getting Started

See the setup section in [the readme](./README.md) for details about setting up
this config!
