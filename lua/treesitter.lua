-- Treesitter parses languages into an abstract syntax tree, and then provides
-- and API for plugins to integrate with. On its own, it doesn't really do
-- anything, but a lot of plugins use it to do cool things. In particular,
-- catpuccin and gruvbox colorscheme plugins use treesitter to do outstandingly
-- accurate and highly performant syntax highlighting.
--
-- A parser for each language must be installed with `:TSInstall [lang]`. You
-- can get a list of the options with `:TSInstallInfo`. The best way to confirm
-- that treesitter is working is to use `:TSPlaygroundToggle`, which itself is
-- a super cool playground thing that will show you the information coming
-- from treesitter side-by-side with your current source file, and you'll
-- probably learn a thing or two about how your programming language is parsed
-- while you're at it!
--
-- Also notice that I have a fairly extensive list of `ensure_installed`
-- languages. These will be installed if missing as soon as you open neovim
-- for the first time.
--
-- Keep in mind, treesitter uses some pretty wild native dynamically loaded
-- C libraries under the hood, so things can get kind of weird. `:TSUpdate` and
-- `:TSUninstall` are your friends here for, "turning it off and on again."

require("treesitter-context").setup{
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
        },
    },
    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
}

require("nvim-treesitter.configs").setup {
  -- You can put "all" to make treesitter install every available parser
  ensure_installed = {
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
    "gitattributes"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  playground = {
    enabled = true,
    update_time = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    }
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {'markdown'},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
