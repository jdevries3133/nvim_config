local M = {}

function M.gitlabOpenFile()
  local path = vim.fn.expand('%:p')
  local base = os.getenv('GIT_REPO_BASE_URL')

  -- sanity check
  local ok = true
  if (path == nil or path == '') then
    print('file is empty or nil')
    ok = false
  end
  if (base == nil or base == '') then
    print('base repo is not defined; set $GIT_REPO_BASE_URL')
    ok = false
  end

  if (ok) then
    -- construct relative path
    local cwd = vim.fn.getcwd()
    local relpath = vim.fn.substitute(path, cwd .. '/', '', '')

    -- call "open" with the URL to the file in the browser
    io.popen("python3 -c 'import webbrowser; webbrowser.open(\"" .. base .. relpath .. "\")'")
  end

end

function M.setup()
  vim.cmd("command! Gopen lua require('git_remote_open_file').gitlabOpenFile()")
end

return M
