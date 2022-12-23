-- catppuccin is a highly configurable and very nice looking colorscheme.
-- Again, ensure you're using a terminal with TrueColor support, which the
-- default Terminal.app for macOS does NOT have!

require("catppuccin").setup({
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
    },
    color_overrides = {},
    custom_highlights = {},
})

vim.cmd('let g:catppuccin_flavour = "mocha"')
