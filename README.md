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
