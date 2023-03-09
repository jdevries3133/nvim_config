-- Dap = debugger adapter protocol. Config for nvim-dap and nvim-dap-ui are
-- here, and they are used for debugging inside neovim. All debugging-related
-- key shortcuts are prefixed by <space>. You can see all of them at the top
-- in the "mappings" section.
--
-- To be honest, DAP is pretty janky. I often pop VS Code open for debugging,
-- or use the chrome debugger for client-side debugging. Some assembly is also
-- required to get this to work.
--
-- For python, you'll need to install the debugpy module:
--
--    python3 -m pip install debugpy
--
-- You will also need to ensure that `python3 -m debugpy --version` from the
-- command line works in order for neovim to be able to discover the module.
--
-- I still use DAP, but it's very broken right now. I hope and pray that I can
-- get it working better one day.

local dap = require('dap')
local dapui = require('dapui')

--------------------------------- mappings ------------------------------------

local mapopts = {
  noremap = true,
  silent = true
}

local function setup_conditional_breakpoint()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

local set = vim.keymap.set

set('n', '<space>b', dap.toggle_breakpoint, mapopts)
set('n', '<space>B', setup_conditional_breakpoint, mapopts)
set('n', '<space>c', dap.continue, mapopts)
set('n', '<space>n', dap.step_over, mapopts)
set('n', '<space>s', dap.step_into, mapopts)
set('n', '<space>o', dap.step_out, mapopts)
set('n', '<space>r', dap.run_last, mapopts)
set('n', '<space>C', dapui.close, mapopts)
set('n', '<space>O', dapui.open, mapopts)


--------------------------------- dap config ----------------------------------

---- python ----

dap.adapters.python = {
  type = 'executable';
  command = 'python3';
  args = { '-m', 'debugpy.adapter' };
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


---- node ----
--
require("dap-vscode-js").setup({
  -- Path to vscode-js-debug installation.
  debugger_path = os.getenv("HOME") .. "/repos/vscode-js-debug",
  -- which adapters to register in nvim-dap
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, 
  log_file_path = os.getenv("HOME") .. "/.cache/nvim/dap_vscode_js.log",
  log_file_level = vim.log.levels.DEBUG
})


-- we will always try to load launch.json files if they're present
require('dap.ext.vscode').load_launchjs(
  vim.fn.getcwd() .. '/.vscode/launch.json',
  {
    -- mapping of launch types to file names
    ["pwa-node"] = {
      "javascript",
      "typescript",
      "typescriptreact"
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
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
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
