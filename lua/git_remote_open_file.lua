-- This is a custom plugin. It figures out the full URL corresponding to a
-- file in a git repository, and opens that URL on my macOS machines through the
-- "open" CLI. I set GIT_REPO_BASE_URL to
-- "https://github.com/jdevries3133/my_repo/main/," for example, and this
-- plugin concatenates the relative path to the file onto the end of that URL,
-- which becomes the correct fully qualified web URL.
--
-- Broadly, this is quite simple and rough. I probably won't move it forward
-- because it meets the criteria of, "works for me for now!" However, I'm
-- definitely interested in patches to improve it or spin it off into an
-- independently installable plugin. Issues to address are:
--
-- * Relative path is constructed from the current working directory, not the
--   repository root, so it won't work if your cwd is deep inside the repo.
-- * GIT_REPO_BASE_URL environment variable feels unnecessary. For github and
--   gitlab, we can probably just parse the output of `git remote -v`, and
--   maybe fallback to an environment-variable-based override for other types
--   of remotes.
-- * The branch name is a slug somewhere in the url pattern of github and
--   gitlab. To be more precise, we could get the current git branch and
--   include that in the URL.

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
