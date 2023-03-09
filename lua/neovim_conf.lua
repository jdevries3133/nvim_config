-- Native (non-plugin) config that is unique to neovim. Very little "vim-native"
-- config is in this repository because most of it is in `common.vim`, which
-- must be fetched separately since it's part of my vim config.

vim.g.colors_name = "catppuccin"
vim.opt.background = "dark"
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.mouse = nil

-- MFW company typescript setup be like: https://i.imgur.com/mtGc7Sl.mp4
vim.cmd('nnoremap <leader>l :LspRestart<CR>')

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


-- fix comments; convert `//`-style comments to ` * ...`
vim.cmd("vnoremap <leader>c :s/\\/\\// */g<CR>");

-- Neovim comes with a default typescript indentation plugin:
-- https://github.com/jason0x43/vim-js-indent. The plugin behaves super weirdly
-- for comments. It is apparently trying to do prosaic indentation where the
-- first line of a paragraph is indented by 2 spaces. I don't know why anyone
-- would want this and it makes it very difficult to write markdown in
-- typescript comments, so it is disabled
vim.cmd [[
  augroup noindent
    autocmd Filetype typescript,typescriptreact set indentexpr=
  augroup END
]]
