# My nvim Config

Remember to install [vim-plugged](https://github.com/junegunn/vim-plug)
and run `:PlugInstall` to install plugins specified in `init.vim`.

I also use several coc.nvim extensions. They are installed with
`:CocInstall [name]`. All the extensions I use are listed in
`coc-extensions.json`, which is syslinked from this repo to
`~/.config/coc/extensions/package.json`.

## Dependency on Vim Config

My nvim config just extends my base vim configuration, since I realized at
some point that keeping them in sync was a nightmare. Hence, you'll see that
the init.vim here just sources `~/.vim/common.vim`, a file that is part of my
vim config, available here:
[https://github.com/jdevries3133/vim_config](https://github.com/jdevries3133/vim_config)

My setup is to merge these configurations with my dotfiles configuration, where
this and the dotfiles config are submodules. It works well, but leaves this
repo unable to stand on its own.
