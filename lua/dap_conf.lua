-- Dap = debugger adapter protocol. Config for nvim-dap and nvim-dap-ui are
-- here, and they are used for debugging inside neovim. All debugging-related
-- key shortcuts are prefixed by <space>. You can see all of them at the top
-- in the "mappings" section.
--
-- There is no "lsp config" equivalent for DAP, so each language has a bit of
-- assembly required. The beginning of the config sections for each language
-- at the bottom have directions for getting them setup.

local dap = require('dap')
local dapui = require('dapui')
local shortcuts = require('shortcuts').my_custom_shortcuts
local apply_shortcut = require('shortcuts').apply_shortcut

--------------------------------- mappings ------------------------------------

local mapopts = {
  noremap = true,
  silent = true
}

local function setup_conditional_breakpoint()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

local function float_scopes()
  dapui.float_element("scopes", {
    width = 120,
    height = 90,
    enter = true,
    position = "center"
  })
end

apply_shortcut('n', shortcuts.dap_toggle_breakpoint, dap.toggle_breakpoint, mapopts)
apply_shortcut('n', shortcuts.dap_set_conditional_breakpoint, setup_conditional_breakpoint, mapopts)
apply_shortcut('n', shortcuts.dap_continue, dap.continue, mapopts)
apply_shortcut('n', shortcuts.dap_step_over, dap.step_over, mapopts)
apply_shortcut('n', shortcuts.dap_step_into, dap.step_into, mapopts)
apply_shortcut('n', shortcuts.dap_step_out, dap.step_out, mapopts)
apply_shortcut('n', shortcuts.dap_ui_close, dapui.close, mapopts)
apply_shortcut('n', shortcuts.dap_ui_open, dapui.open, mapopts)
apply_shortcut('n', shortcuts.dap_float_scopes, float_scopes, mapopts)
apply_shortcut('v', shortcuts.dap_visual_mode_eval, dapui.eval, mapopts)

-- We will always try to load launch.json files if they're present; I find
-- this generally better than catchall configs (like I have above for python).
-- Most projects have too much stuff going on for a default config to work
-- well
require('dap.ext.vscode').load_launchjs(
  vim.fn.getcwd() .. '/.vscode/launch.json',
  {
    -- mapping of launch types to file names
    ["pwa-node"] = {
      "javascript",
      "typescript",
      "typescriptreact"
    },
    ["codelldb"] = {
      "rust"
    }
  }
)

--------------------------------- ui ------------------------------------------

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position.
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 60,
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,  -- These can be integers or a float between 0 and 1.
    max_width = nil,   -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})


-- make dapui automatically open when dap is launched
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

--------------------------------- python --------------------------------------

-- For python, you'll need to install the debugpy module:
--
--    python3 -m pip install debugpy
--
-- You will also need to ensure that `python3 -m debugpy --version` from the
-- command line works in order for neovim to be able to discover the module.

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    name = "run current file (generic)",
    type = "python",
    request = "launch",
    program = "${file}",
    pythonPath = "python3",
  },
  {
    name = "unittest (generic)",
    type = "python",
    request = "launch",
    module = "unittest",
    pythonPath = "python3"
  },
  {
    name = "pytest (generic)",
    type = "python",
    request = "launch",
    module = "pytest",
    pythonPath = "python3"
  }
}


--------------------------------- node ----------------------------------------
-- Clone `vscode-js-debug` and build it locally. Then, provide the path to
-- the build on your machine. I am using:
--
-- revision: 59abbf94a713ad8db1dd441b3287d0e7f97c3fca
-- repository: https://github.com/microsoft/vscode-js-debug.git

require("dap-vscode-js").setup({
  debugger_path = os.getenv("HOME") .. "/repos/vscode-js-debug",
  -- which adapters to register in nvim-dap
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
  log_file_path = os.getenv("HOME") .. "/.cache/nvim/dap_vscode_js.log"
})



--------------------------------- rust (lldb) ---------------------------------

-- lldb config came from https://www.reddit.com/r/neovim/comments/q2hxkg/anyone_using_nvimdap_with_codelldb/
-- (top comment)

-- this guy: https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
-- needs to be installed and on your $PATH for this to work
--
-- Then, execute `codelldb --port 13000` before and during any debugging
-- sessions. This just needs to be running in the background somewhere.
dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000
}

dap.configurations.c = {
  {
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    --program = '${fileDirname}/${fileBasenameNoExtension}',
    cwd = '${workspaceFolder}',
    terminal = 'integrated'
  }
}

dap.configurations.cpp = dap.configurations.c

-- I prefer to have the launch.json per-project, but this guy's catch-all
-- debug setup is actually pretty generally useful, so I'll keep it around. I
-- like how he prompts for the path to the executable..
-- dap.configurations.rust = {
--     {
--         type = 'codelldb',
--         request = 'launch',
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         terminal = 'integrated',
--         sourceLanguages = { 'rust' }
--     }
-- }
