-- This is the stuff at the bottom of the UI, you can configure exactly what
-- it shows you. For example, I like to have the current working directory
-- because `:cd` is a very common part of my workflow as I move around a repo
-- without closing neovim.

local function cwd()
    Home = os.getenv("HOME")
    cwd = vim.loop.cwd()
    return cwd:gsub(Home, "~")
end

require('lualine').setup {
    theme = 'tokyonight',
    options = {
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'lsp_progress'},
        lualine_y = {'progress', 'filetype'},
        lualine_z = {
            'location',
            cwd
        }
    }
}
