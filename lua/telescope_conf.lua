-- Telescope is the UI layer for the popup search thing. It calls out to many
-- search backends, and here I have keyboard shortcuts for the most popular
-- ones, all of which have a common prefix of <leader>t, for telescope.
--
-- In command mode, do :Telescope <tab> to see the full list of options, there
-- might be some that you would like to try tha I don't have keyboared
-- shortcuts for.

local shortcuts = require('shortcuts').my_custom_shortcuts

require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    pickers = {
        find_files = {
            hidden = true
        },
        colorscheme = {
            enable_preview = true
        }
    }
}

-- Note: the `fd` file-finder searches through stuff in `.git`, but acknowledges
-- `.gitignore` files. To make it be not-stupid inside git repos, a handy
-- hack is:
--
--     echo '*' > .git/.gitignore
--

local function telescope_shortcut(mapping, telescope_command)
  if not mapping then
    return
  end
  vim.cmd("nnoremap " .. mapping .. " <cmd>Telescope " .. telescope_command .. "<cr>")
end

telescope_shortcut(shortcuts.telescope_find_files, 'find_files')
telescope_shortcut(shortcuts.telescope_live_grep, 'live_grep')
telescope_shortcut(shortcuts.telescope_buffers, 'buffers')
telescope_shortcut(shortcuts.telescope_jumplist, 'jumplist')
telescope_shortcut(shortcuts.telescope_git_commits, 'git_commits')
telescope_shortcut(shortcuts.telescope_git_branches, 'git_branches')
telescope_shortcut(shortcuts.telescope_lsp_diagnostics, 'diagnostics')
telescope_shortcut(shortcuts.telescope_colorscheme, 'colorscheme')
telescope_shortcut(shortcuts.telescope_git_status, 'git_status')
