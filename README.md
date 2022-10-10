# My nvim Config

Remember to install [vim-plugged](https://github.com/junegunn/vim-plug)
and run `:PlugInstall`. There will be lots of startup errors until you do that!

## Dependency on Vim Config

This config depends on `~/.vim/common.vim` from my
[vim config.](https://github.com/jdevries3133/vim_config)
It is sourced in `init.vim`.

Either clone my vim config into `~/.vim` and use that as well,
or just use this shell script to grab the latest `common.vim` all by itself:

```bash
mkdir -p $HOME/.vim
curl \
  -o $HOME/.vim/common.vim \
  https://raw.githubusercontent.com/jdevries3133/vim_config/main/common.vim
```

## Colors

Catppuccin requires a terminal emulator with TrueColor support. macOS's default
"Terminal.app," for example, does not support this. iTerm2 is an alternative.
It's easy to tweak this config for terminals that don't support TrueColor if
you don't want to move to one:

1. Remove Catppuccin from the plugins in ./plugins.vim
2. Use any other color scheme; the plugin file is annotated with which ones
   work on any (256 color) terminal
