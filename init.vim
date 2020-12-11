""""""""""""""""" My shortcuts and personal preferences """""""""""""""""""""""
tnoremap jk <C-\><C-n>
inoremap jk <Esc>

" Clear search highlight on press "enter"
nnoremap <cr> :noh<cr><cr>

" Ctrl + hjkl to move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c

" Cycle through buffers with <leader>n and <leader>N
map <leader>n :bn<cr>
map <leader>N :bp<cr>

" Delete buffer without closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>

" Cycle through tabs with <leader>t
map <leader>t :tabn<cr>

" Input python docstring with <leader>d
map <leader>d A<cr>"""<cr><cr>"""<Esc>kA<tab>

" Input python breakpoint with <leader>b
map <leader>b A<cr>breakpoint()<Esc>

" Colorschemes.
"   My three favorites are here and I just toggle on the one I want by
"   commenting / uncommenting.
colorscheme Tomorrow-Night  "dark
" colorscheme zenburn         "dark
" colorscheme xcode-default   "light

" Quickly switch to my favorite light colorscheme with <leader>x
map <leader>x :colorscheme xcode-default<cr>

" Python providers
"   Somewhere, install a python2.* and python3.* virtual environment for
"   neovim. In each virtual environment, run 'pip install jedi neovim'
"
"   Then, put the path to the actual python interpreter within each of those
"   environments here.
let g:python_host_prog = "/Users/JohnDeVries/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/JohnDeVries/.pyenv/versions/neovim3/bin/python3"

" General purpose vim settings
"   You can get more info on all of these with :help ____, but I like having
"   the notes right here so you're not just copying stuff and having no idea
"   what it does without doing a vim-help-research-project.
set showtabline=2           " Always show file name at the top
syntax enable on            " Enable syntax highlighting
set nowrap                  " Do not wrap lines; not good for all files, but my preference!
set showmode                " Show current editor mode in bottom left
set showcmd                 " Normal mode; show keys you pressed (bottom-right)
set title                   " see :h title
set hidden                  " see :h hidden
set exrc                    " allow plugins to execute .vimrc files
set secure                  " recommended to accompany 'set exrc'
set number relativenumber   " turn cursor-relative line numbering on
set nu rnu                  " current line shows absolute line number
set path=$PWD/**            " Update find path to search subdirectories
set undolevels=1000         " Save the last 1000 edits in undo history
set list                    " Display tabs and trailing whitespace
set wildmenu                " Autocomplete command on <tab>
set colorcolumn=80,100      " Column length rulers at 80 and 100 characters

" The next four settings completely prevent vim from backing your work up
" anywhere. If, like me, you type :w after basically every line you write,
" you'll be ok!
set nobackup
set nowritebackup
set nowb
set noswapfile

set wildignore+=*.pyc,*.pyo,*/__pycache__/*     " Python
set wildignore+=*.swp,~*                        " Temp files
set wildignore+=*.zip,*.tar                     " Archives
set wildignore+=node_modules/*                  " Javascript / Node.js

" Tab sanity
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype make setlocal noexpandtab

" netrw is vim's built in file explorer. It's default appearance is ugly.
let g:netrw_banner=0
let g:netrw_altv=1
" What netrw_browse_split does
                " =0: re-using the same window  (default)
                " =1: horizontally splitting the window first
                " =2: vertically   splitting the window first
                " =3: open file in new tab
                " =4: act like "P" (ie. open previous window)
let g:netrw_browse_split=0
let g:netrw_list_hide =  '^\.[^\.],'
let g:netrw_list_hide .= '\.pyc$,'
let g:netrw_list_hide .= '\.o$,\.obj$,'
let g:netrw_list_hide .= '\.a$,\.so$,\.lib$,\.dll$,'
let g:netrw_list_hide .= '\.pyc\s\+,'
let g:netrw_list_hide .= '\.o\s\+,\.obj\s\+,'

" replace error bell with visual bell
set noerrorbells visualbell t_vb=


highlight Comment cterm=bold

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
                            " GENERAL TOOLING
Plug 'gmarik/vundle'                            " Package Manager
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tommcdo/vim-fugitive-blame-ext'           " Git blame extension
Plug 'tpope/vim-commentary'                     " Comment anything out with gcc
Plug 'tpope/vim-sensible'                       " a universal set of defaults that (hopefully) everyone can agree on.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelligent auto-complete

                            " CSS & SCSS
Plug 'cakebaker/scss-syntax.vim'                " syntax highlighting

                            " PYTHON
Plug 'Vimjas/vim-python-pep8-indent'            " pep8 indenting
Plug 'vim-python/python-syntax'                 " syntax highlighting
let g:python_highlight_all = 1

                            " CHROME EXTENSION (use nvim embedded in chrome)
Plug 'glacambre/firenvim'

" A lot of vim script, but it literally just sets nvim to a fixed size when
" opened in the browser.
function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction

function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
    set lines=20                    " NUM LINES ON FIRENVIM LAUNCH
    set columns=90                  " NUM COLS  ON FIRENVIM LAUNCH
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                   Spaghetti a la neoclide/coc.nvim
" This is the default init.vim config recommended in the repo readme. It sets
" all the key bindings for code completion.
" 
" See https://github.com/neoclide/coc.nvim for details
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
