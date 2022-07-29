# My nvim Config

Remember to install [vim-plugged](https://github.com/junegunn/vim-plug)
and run `:PlugInstall` to install plugins specified in `plugins.vim`.

## Dependency on Vim Config

A file named `~/.vim/common.vim` is part of my vim config, and contains the
common settings between vim and neovim. This configuration sources it in the
`init.vim`, so either clone my vim config into `~/.vim` and use that as well,
or just copy and paste the `common.vim` file from
[that repo](https://github.com/jdevries3133/vim_config)
