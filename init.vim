"""""""""""""""" My shortcuts and personal preferences """""""""""""""""""""""

" Map jk to Escape
tnoremap jk <C-\><C-n>
inoremap jk <Esc>

"Clear searchhighlight on press "enter"
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Ctrl + hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c

" Cycle through buffers with <leader>n and <leader>N
nnoremap <silent> <leader>n :bn<cr>
nnoremap <silent> <leader>N :bp<cr>

" Cycle through quickfix list with <leader>c and <leader>C
nnoremap <silent> <leader>c :cn<cr>
nnoremap <silent> <leader>C :cp<cr>

" Delete buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>

" Input python docstring with <leader>d
nnoremap <leader>d o"""<cr><cr>"""<Esc>ki

" Input python breakpoint with <leader>b
nnoremap <leader>b obreakpoint()<Esc>

" Spell check in current buffer
nnoremap <silent> <leader>s :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <leader>S :setlocal nospell<CR>

" Toggle fold
nnoremap <leader>f zA
" Syntax fold, for C-like languages
nnoremap <silent> <leader>Fs :set foldmethod=syntax<CR>
" Indent fold for python
nnoremap <silent> <leader>Fi :set foldmethod=indent<CR>
" Open all folds
nnoremap <silent> <leader>Fn :set foldmethod=manual<CR>zR

" Terminal shortcuts
"
" <leader>t => open existing terminal in new tab
" <leader>T => open new terminal in new tab
" tt => open existing terminal in current window
nnoremap <silent> <leader>t :tabnew<CR>:buffer ter<Tab><CR>
nnoremap <silent> <leader>T :tabe +ter<CR>
nnoremap <silent> tt :buffer term<Tab><CR>

" Colorschemes (install these: https://github.com/flazz/vim-colorschemes)
colorscheme Atelier_SavannaDark

" E to enter netrw from normal mode
nnoremap E :E<cr>

" Open peps quickly
command -nargs=+ Pep :e ~/repos/peps/pep-<args>.txt

" Fast make
cnoremap mj<cr> make -j<cr>

" Toggle colorcolumn
command! -nargs=1 Ruler :set colorcolumn=<args>

"""""""""""""""""""" General purpose vim settings """"""""""""""""""""""""""""
"   You can get more info on all of these with :help ____, but I like having
"   the notes right here so you're not just copying stuff and having no idea
"   what it does without doing a vim-help-research-project.
set showtabline=2           " Always show file name at the top
syntax on                   " Enable syntax highlighting
set nowrap                  " Do not wrap lines; not good for all files, but my preference!
set showcmd                 " Normal mode; show keys you pressed (bottom-right)
set exrc                    " allow plugins to execute .vimrc files
set secure                  " recommended to accompany 'set exrc'
set number relativenumber   " turn cursor-relative line numbering on
set path=$PWD/**5           " Update find path to search up to 5 subdirectories
set list                    " Display tabs and trailing whitespace
set wildmenu                " Completion suggestions listed on <tab> press
set lazyredraw              " Do not draw when executing macros, etc

" The next four settings completely prevent vim from backing your work up
" anywhere. If, like me, you type :w after basically every line you write,
" you'll be ok!
set hidden
set nobackup
set nowritebackup
set noswapfile

set wildignore+=*.pyc,*.pyo,*/__pycache__/*     " Python
set wildignore+=*.o,*.ko,*.obj,*.dSYM           " C
set wildignore+=*.swp,~*                        " Temp files
set wildignore+=*.zip,*.tar                     " Archives
set wildignore+=node_modules/*                  " Javascript / Node.js

"  tab/space stops
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

augroup tabconf
    autocmd!
    autocmd Filetype yaml,html,css,htmldjango,javascript,markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd Filetype rst setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab
augroup END

" Python providers
"   Somewhere, install a python2.* and python3.* virtual environment for
"   neovim. In each virtual environment, run 'pip install jedi neovim'
"
"   Then, put the path to the actual python interpreter within each of those
"   environments here.
let g:python_host_prog = "/Users/JohnDeVries/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/JohnDeVries/.pyenv/versions/neovim3/bin/python3"

" netrw is vim's built in file explorer. It's default appearance is ugly.
let g:netrw_banner=0

" What netrw_browse_split does
                " =0: re-using the same window  (default)
                " =1: horizontally splitting the window first
                " =2: vertically   splitting the window first
                " =3: open file in new tab
                " =4: act like "P" (ie. open previous window)
let g:netrw_browse_split=0

" netrw_liststyles:
    " 1: thin
    " 2: long
    " 3: wide
    " 4: tree
let g:netrw_liststyle = 3

" replace error bell with visual bell
set noerrorbells visualbell t_vb=

" Comments are bold
highlight Comment cterm=bold
" nvim inherits terminal background (nvim background is transparent)
" highlight Normal guibg=NONE ctermbg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" All that follows are plugins. They are managed by vim-plug, a package
" manager for vim plugins. To quickly setup vim on a remote machine, only
" copy everything above.
"
" For your local machine, first install vim-plug by following the instructions
" at https://github.com/junegunn/vim-plug. Then, after launching vim, run
" :PlugInstall
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
                            " GENERAL PURPOSE
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tpope/vim-commentary'                     " Comment anything out with gcc
Plug 'tpope/vim-sensible'                       " a universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-surround'                       " surrounding movements
Plug 'tommcdo/vim-fugitive-blame-ext'           " Git blame extension
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelligent auto-complete
Plug 'fweep/vim-zsh-path-completion'            " ZSH-like file path completion
cmap <S-Tab> <Plug>ZshPathComplete

                            " PYTHON
Plug 'Vimjas/vim-python-pep8-indent'            " pep8 indenting
Plug 'vim-python/python-syntax'                 " syntax highlighting
let g:python_highlight_all = 1

                            " JAVASCRIPT & TYPESCRIPT
Plug 'yuezk/vim-js'                             " Syntax highlighting
Plug 'MaxMEllon/vim-jsx-pretty'                 " JSX syntax highlighting
Plug 'leafgarland/typescript-vim'               " Typescript
Plug 'peitalin/vim-jsx-typescript'              " TSX (JSX in Typescript)

                            " C
Plug 'NLKNguyen/c-syntax.vim'

call plug#end()


" Aliases and preferences for git-fugitive commands
command! -nargs=0 Gc :Git commit -v
command! -nargs=0 Gd :Git diff
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdqf :Git difftool


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                   Spaghetti a la neoclide/coc.nvim
" This is the default init.vim config recommended in the repo readme. It sets
" all the key bindings for code completion.
" 
" See https://github.com/neoclide/coc.nvim for details
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=col:\ %c\ \|\ %{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
