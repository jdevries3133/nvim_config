-- Native (non-plugin) config that is unique to neovim. Very little "vim-native"
-- config is in this repository because most of it is in `common.vim`, which
-- must be fetched separately since it's part of my vim config.

if os.getenv('NEOVIM_LIGHT') == '1' then
  vim.g.colors_name = "catppuccin-latte"
  vim.opt.background = "light"
else
  vim.g.colors_name = "catppuccin-mocha"
  vim.opt.background = "dark"
end

vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.mouse = nil
vim.opt.guicursor = "i:block"

vim.cmd('nnoremap <leader>l :LspRestart<CR>')

vim.cmd('nnoremap <leader>nn :NoNeckPain<CR>')

-- This is the default, but serves as a reminder to set cmdheight = 0 when it
-- becomes stable. The cmdheight = 0 option was introduced in neovim 0.8, but
-- it's considered experimental and definitely feels experimental. There are
-- some wonky interactions with plugins where it will show some text and prompt
-- you to press "enter" to make it go away, requiring an extra keystroke to
-- facilitate the zero-height UI at the bottom without causing you to lose
-- important information. This is especially annoying when working with
-- dadbod-ui, for example. Until the ergonomics improve, or the plugins are
-- updated to support this setting better, I need to keep cmdheight = 1.
vim.opt.cmdheight = 1

-- Neovim comes with a default typescript indentation plugin:
-- https://github.com/jason0x43/vim-js-indent. The plugin behaves super weirdly
-- for comments. It is apparently trying to do prosaic indentation where the
-- first line of a paragraph is indented by 2 spaces. I don't know why anyone
-- would want this and it makes it very difficult to write markdown in
-- typescript comments, so it is disabled
vim.cmd [[
  augroup noindent
    autocmd Filetype javascript,javascriptreact,typescript,typescriptreact set indentexpr=
  augroup END
]]

vim.cmd[[
  autocmd FileType mysql setlocal commentstring=--\ %s
]]

vim.cmd('nnoremap <leader>db :DBUI<CR>')
