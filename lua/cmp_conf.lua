-- neovim-cmp provides "intellisense" completion prompts from LSP data and
-- other sources.

local cmp = require('cmp')


-- I don't know why sumenko lua complains that I need to cehck for nil but sure
if (cmp == nil) then
  print("error: nvim cmp not configured")
  return
end

-- disable cmp for log files, since buffer completion is super slow for huge
-- files
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.log",
  callback = function ()
    if vim.bo.filetype == "log" then
      cmp.setup.buffer { enabled = false }
    end
  end}
)


cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'snippy' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})
