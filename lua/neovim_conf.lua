-- Most of my "generic" vim config preferences are in the
-- [`common.vim`](https://github.com/jdevries3133/vim_config/blob/main/common.vim)
-- file of my vim config. Thus, there are only a very few lingering items here
-- which are my neovim-specific ad-hoc config items.

local shortcuts = require("shortcuts").my_custom_shortcuts

if os.getenv('NEOVIM_LIGHT') == '1' then
  vim.g.colors_name = "catppuccin-latte"
  vim.opt.background = "light"
else
  vim.g.colors_name = "sonokai"
  vim.opt.background = "dark"
end

vim.o.termguicolors = true
vim.opt.guicursor = "i:block"
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

if shortcuts.lsp_restart then
  vim.cmd('nnoremap ' .. shortcuts.lsp_restart .. ' :LspRestart<CR>')
end
if shortcuts.toggle_no_neck_pain then
  vim.cmd('nnoremap ' .. shortcuts.toggle_no_neck_pain .. ' :NoNeckPain<CR>')
end

-- Neovim comes with a default typescript indentation plugin:
-- https://github.com/jason0x43/vim-js-indent. The plugin behaves super weirdly
-- for comments. It is apparently trying to do prosaic indentation where the
-- first line of a paragraph is indented by 2 spaces. I don't know why anyone
-- would want this and it makes it very difficult to write markdown in
-- typescript comments, so I'm disabling it. The default vim indentation
-- behavior from the days of vi / C is just fine for Javascript and Typescript.
vim.cmd [[
  augroup noindent
    autocmd Filetype javascript,javascriptreact,typescript,typescriptreact set indentexpr=
  augroup END
]]

-- dadbod.vim (or dadbod-ui, I'm not sure) uses a filetype of 'mysql'.
-- Vim-commentary can't figure out which type of comment it should use in this
-- case, so we'll help it along by kindly asking it to comment lines out by
-- prepending them with `-- `
vim.cmd[[
  autocmd FileType mysql setlocal commentstring=--\ %s
  autocmd FileType sql setlocal commentstring=--\ %s
]]
