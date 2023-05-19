-- LSP = language server protocol.
--
-- The mappings section at the top is most relevant for day-to-day usage. Also
-- the most likey thing you might want to change around.
--
-- A very tiny 1-line config is required for the language servers you plan to
-- use; you need to pass the on_attach callback into each one so that the
-- keyboard shortcuts will be setup for that buffer. This configuration is at
-- the bottom of the module and you'll find that the LSP you want is probably
-- already configured. 
--
-- These are the LSPs that are 100% configured; you don't need to make a config
-- change to use them:
--
-- | Server        | Language(s)                          |
-- | ------------- | ------------------------------------ |
-- | pyright       | python                               |
-- | tsserver      | Javascript / Typescript              |
-- | eslint        | Javascript / Typescript (linting)    |
-- | rust_analyzer | Rust                                 |
-- | clangd        | C / C++                              |
-- | dockerls      | Dockerfiles                          |
-- | dartls        | Dart                                 |
-- | lua_ls        | lua                                  |
-- | tailwindcss   | everywhere tailwind classes are used |
--
-- One last step: when you're happy with the keyboard shortcuts and checked that
-- your language is in the table above, you do need to install the actual LSP
-- program on your machine. nvim-lsp-installer makes this extremely easy, just
-- run `LspInstallInfo` to get a list of all servers it can install. Just
-- scroll to the server you want, and press `i` to install it.

require("nvim-lsp-installer").setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
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

-- keep the configured language servers in sync with the list in the docstring
-- at the top of the module
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
}
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
}
require('lspconfig')['eslint'].setup {
  on_attach = on_attach,
}
require('lspconfig')['rust_analyzer'].setup {
  on_attach = on_attach,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}
require('lspconfig')['clangd'].setup {
  on_attach = on_attach,
}
require('lspconfig')['dockerls'].setup {
  on_attach = on_attach,
}
require('lspconfig')['dartls'].setup {
  on_attach = on_attach,
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require('lspconfig')['lua_ls'].setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
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
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
}

require('lspconfig')['tailwindcss'].setup {
  on_attach = on_attach,
}

-- emmet language server is really annoying if I'm not vomitting a large volume
-- of html (most projects) but very useful if I am (new projects, personal
-- projects, etc.). So, I have this environment variable to turn it on or off.
if vim.fn.getenv('NVIM_USE_EMMET_LS') then
  require('lspconfig')['emmet_ls'].setup {
    on_attach = on_attach,
  }
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
