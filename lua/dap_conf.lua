-- nvim-dap, nvim-dap-ui, and dap virtual text config for debugging inside
-- neovim

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

-- python

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


-- node
dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/repos/vscode_node_debug/out/src/nodeDebug.js' },
}


-- we will always try to load launch.json files if they're present
require('dap.ext.vscode').load_launchjs(
  vim.fn.getcwd() .. '/.vscode/launch.json',
  {
    -- mapping of launch types to file names
    ["node"] = {
      "javascript",
      "typescript",
      "typescriptreact"
    },
    ["lldb"] = {
      "rust",
      "C",
      "C++"
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
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
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
