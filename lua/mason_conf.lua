-- LSP = language server protocol.
--
-- This is where the fancy IDE-like magic happens.
--
-- Neovim itself is an LSP client, it talks to the LSP server. The LSP server
-- is where all the language-specific code smartness is implemented, which
-- obviously varies between different languages.

require("mason").setup({})

local shortcuts = require("shortcuts").my_custom_shortcuts
local apply_shortcut = require("shortcuts").apply_shortcut

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
apply_shortcut('n', shortcuts.lsp_diagnostic_goto_next, vim.diagnostic.goto_prev, opts)
apply_shortcut('n', shortcuts.lsp_open_float, vim.diagnostic.open_float, opts)
apply_shortcut('n', shortcuts.lsp_diagnostic_set_loclist, vim.diagnostic.setloclist, opts)
apply_shortcut(
  'n',
  shortcuts.diagnostic_put_errors_into_quickfixlist,
  function()
    vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
  end,
  { noremap = true, silent = true }
)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o> in insert mode
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  apply_shortcut('n', shortcuts.lsp_goto_definition, vim.lsp.buf.definition, bufopts)
  apply_shortcut('n', shortcuts.lsp_goto_references, vim.lsp.buf.references, bufopts)
  apply_shortcut('n', shortcuts.lsp_hover, vim.lsp.buf.hover, bufopts)
  apply_shortcut('n', shortcuts.lsp_rename, vim.lsp.buf.rename, bufopts)
  apply_shortcut('n', shortcuts.lsp_format, vim.lsp.buf.format, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require('mason-lspconfig').setup_handlers({
  function(server)
    vim.lsp.config(server, {
      on_attach = on_attach,
      capabilities = capabilities,
      root_markets = { '.git' }
    })
    vim.lsp.enable(server)
  end,
  ["lua_ls"] = function()
    local runtime_path = vim.split(package.path, ';')
    vim.lsp.config("lua_ls", {
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique
          -- identifier
          telemetry = {
            enable = false,
          },
        },
      }
    })
    vim.lsp.enable("lua_ls")
  end,
  ["rust_analyzer"] = function()
    vim.lsp.config("rust_analyzer", {
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            --features = {
            --  -- Kind of annoying, but we need to hard-code the features that
            --  -- rust-analyzer will acknowledge as enabled across all projects.
            --  --
            --  -- If this gets unsustainable, it seems doable to read from some
            --  -- config file on startup per-project, but this is fine for now.
            --  "list",
            --  "features",
            --  "here",
            --}
          }
        }
      }
    })
    vim.lsp.enable("rust_analyzer")
  end
})
