-- Treesitter parses languages into an abstract syntax tree, and then provides
-- an API for plugins to integrate with. On its own, it doesn't really do
-- anything, but a lot of plugins use it to do cool things. In particular,
-- catpuccin and gruvbox colorscheme plugins use treesitter to do outstandingly
-- accurate and highly performant syntax highlighting.
--
-- As of Neovim 0.12, nvim-treesitter switched from master to main branch with
-- a full rewrite. The new version no longer uses nvim-treesitter.configs for
-- setup, and no longer handles highlight/indent via setup options. Instead:
--   - Highlighting is enabled via a FileType autocmd (vim.treesitter.start)
--   - Indentation is enabled via vim.bo.indentexpr
--   - Parser installation is done via require('nvim-treesitter').install()
--
-- Use :InspectTree to see the syntax tree (replaces the old playground plugin).
-- Use :TSUpdate to rebuild parsers after updates.
-- Use :TSUninstall all + :TSUpdate to do a clean reinstall.

require("treesitter-context").setup{
    enable = true,
    max_lines = 5,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
        },
    },
    zindex = 20,
    mode = 'cursor',
}

-- Install any missing parsers on startup
local ensureInstalled = {
  "c",
  "vim",
  "lua",
  "rust",
  "javascript",
  "typescript",
  "bash",
  "diff",
  "gitcommit",
  "gitignore",
  "git_rebase",
  "gitattributes",
}
local alreadyInstalled = require('nvim-treesitter.config').get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
  :filter(function(parser)
    return not vim.tbl_contains(alreadyInstalled, parser)
  end)
  :totable()
if #parsersToInstall > 0 then
  require('nvim-treesitter').install(parsersToInstall)
end

-- Enable treesitter highlighting and indentation per filetype.
-- The old nvim-treesitter.configs highlight/indent options no longer exist.
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Enable treesitter highlighting (disable = markdown preserved from old config)
    local ft = vim.bo.filetype
    if ft ~= 'markdown' then
      pcall(vim.treesitter.start)
    end
    -- Enable treesitter-based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Treesitter-based folding
-- nvim_treesitter#foldexpr() is gone; use the built-in vim.treesitter.foldexpr
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
