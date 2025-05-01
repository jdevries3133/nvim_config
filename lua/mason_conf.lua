-- LSP = language server protocol.
--
-- This is where the fancy IDE-like magic happens.
--
-- Neovim itself is an LSP client, it talks to the LSP server. The LSP server
-- is where all the language-specific code smartness is implemented, which
-- obviously varies between different languages.

require("mason").setup({})
require("mason-lspconfig").setup()


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
  function ()
    vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
  end,
  { noremap = true, silent = true }
)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o> in insert mode
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  apply_shortcut('n', shortcuts.lsp_goto_definition, vim.lsp.buf.definition, bufopts)
  apply_shortcut('n', shortcuts.lsp_goto_references, vim.lsp.buf.references, bufopts)
  apply_shortcut('n', shortcuts.lsp_hover, vim.lsp.buf.hover, bufopts)
  apply_shortcut('n', shortcuts.lsp_rename, vim.lsp.buf.rename, bufopts)
  -- Note: the JavaScript ecosystem has no official code formatter so this
  -- might not work right. If you try to use this, it will dispatch to the
  -- formatting behavior of ts-server, which may not be the code formatter you
  -- want or use.
  apply_shortcut('n', shortcuts.lsp_format, vim.lsp.buf.format, opts)
end


-- this location handler populates the quickfixlist but does not open the
-- `:copen` drawer
local function location_handler(_, result, ctx)
  vim.g.lsp_last_word = vim.fn.expand('<cword>')
  if result == nil or vim.tbl_isempty(result) then
    print(ctx.method, 'No location found')
    return nil
  end
  local util = require('vim.lsp.util')
  if vim.tbl_islist(result) then
    if #result == 1 then
      util.jump_to_location(result[1], 'utf-8', true)
    elseif #result > 1 then
      vim.fn.setqflist(util.locations_to_items(result, 'utf-8'))
    end
  else
    util.jump_to_location(result, 'utf-8', true)
  end
end


vim.lsp.handlers['textDocument/declaration'] = location_handler
vim.lsp.handlers['textDocument/definition'] = location_handler
vim.lsp.handlers['textDocument/typeDefinition'] = location_handler
vim.lsp.handlers['textDocument/implementation'] = location_handler
vim.lsp.handlers['textDocument/references'] = location_handler

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function ()
    require("lspconfig")["rust_analyzer"].setup {
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
    }
  end,
  ["lua_ls"] = function ()
    local runtime_path = vim.split(package.path, ';')
    require("lspconfig")["lua_ls"].setup {
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
    }
  end,
}
