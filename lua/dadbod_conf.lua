vim.g.dbs = {
  dev = vim.fn.getenv("DEV_DB_URL"),
  prod = vim.fn.getenv("PROD_DB_URL")
}
