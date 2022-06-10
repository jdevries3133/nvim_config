source $HOME/.vim/common.vim
source $HOME/.vim/snippets.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc-config.vim

let g:gruvbox_material_background = 'medium'
set background=dark
colorscheme gruvbox-material

autocmd BufEnter * set laststatus=3

set cmdheight=1

" nvim only, because I have the statusline plugin
set noshowmode
