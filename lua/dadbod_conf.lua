-- dadbod.vim is a SQL client for vim. After configuring your environment,
-- launch it with `:DBUI`

local shortcuts = require("shortcuts").my_custom_shortcuts

-- "dev" and "prod" don't have any special meaning. Keys in this table should
-- be names for the database(s) that make sense to you, and values should be
-- connection strings for those databases, presumably provided through
-- environmet variables since they'll include secrets.
vim.g.dbs = {
  dev = vim.fn.getenv("DEV_DB_URL"),
  prod = vim.fn.getenv("PROD_DB_URL")
}

if shortcuts.dadbod_ui_open then
  vim.cmd('nnoremap ' .. shortcuts.dadbod_ui_open .. ' :DBUI<CR>')
end
