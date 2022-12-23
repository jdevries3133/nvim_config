-- Telescope is the UI layer for the popup search thing. It calls out to many
-- search backends, and here I have keyboard shortcuts for the most popular
-- ones, all of which have a common prefix of <leader>t, for telescope.
--
-- In command mode, do :Telescope <tab> to see the full list of options, there
-- might be some that you would like to try tha I don't have keyboared
-- shortcuts for.

require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

-- TODO: a bit blursed to do this all through vim.cmd; convert these to proper
-- lua calls
vim.cmd("nnoremap <leader>tf <cmd>Telescope find_files<cr>")
vim.cmd("nnoremap <leader>tg <cmd>Telescope live_grep<cr>")
vim.cmd("nnoremap <leader>tb <cmd>Telescope buffers<cr>")
vim.cmd("nnoremap <leader>tj <cmd>Telescope jumplist<cr>")
vim.cmd("nnoremap <leader>ts <cmd>Telescope lsp_workspace_symbols<cr>")
vim.cmd("nnoremap <leader>tc <cmd>Telescope git_commits<cr>")
vim.cmd("nnoremap <leader>tr <cmd>Telescope git_branches<cr>")
vim.cmd("nnoremap <leader>td <cmd>Telescope diagnostics<cr>")
