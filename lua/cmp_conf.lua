-- neovim-cmp provides "intellisense" completion prompts from LSP data and
-- other sources.

local cmp = require('cmp')
local shortcuts = require("shortcuts").my_custom_shortcuts

-- I don't know why sumenko lua complains that I need to cehck for nil but sure
if (cmp == nil) then
  print("error: nvim cmp not configured")
  return
end

-- Disable cmp for log files. Since buffer completion is super slow for huge
-- files
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.log",
  callback = function ()
    if vim.bo.filetype == "log" then
      cmp.setup.buffer { enabled = false }
    end
  end}
)

-- A bit suspicious that I need to implement this... bet there's an
-- out-of-the-box that I'm missing here...
local function next_suggestion(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

-- ditto
local function prev_suggestion(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end


local cmp_mappings = {}
local function add_mapping(mapping, fn)
  if mapping then
    cmp_mappings[mapping] = fn
  end
end

add_mapping(shortcuts.completion_scroll_docs_back, cmp.mapping.scroll_docs(-4))
add_mapping(shortcuts.completion_scroll_docs_forward, cmp.mapping.scroll_docs(4))
add_mapping(shortcuts.completion_next_suggestion, next_suggestion)
add_mapping(shortcuts.completion_previous_suggestion, prev_suggestion)

cmp.setup({
  mapping = cmp.mapping.preset.insert(cmp_mappings),
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'snippy' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})
