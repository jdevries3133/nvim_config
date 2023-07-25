" Detect files ending in `.log` as logfiles. Various bits of config will
" disable some high-level neovim-isms to enable neovim to open gigantic log
" files without having an absolute conniption
au BufNewFile,BufRead *.log set filetype=log
