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

-- mappings to enter dap from normal mode are prefixed by <leader>, like other
-- normal mode actions
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, mapopts)
vim.keymap.set(
  'n',
  '<leader>B', -- conditional breakpoint
  setup_conditional_breakpoint,
  mapopts
)
vim.keymap.set('n', '<leader>d', dap.continue, mapopts)

-- mappings to interact with the debugger, usually run from inside the DAP
-- UI are prefixed by space to avoid cluttering the <leader> namespace while
-- maintaining 2-key combinations
vim.keymap.set('n', '<space>c', dap.continue, mapopts)
vim.keymap.set('n', '<space>s', dap.step_over, mapopts)
vim.keymap.set('n', '<space>i', dap.step_into, mapopts)
vim.keymap.set('n', '<space>o', dap.step_out, mapopts)
vim.keymap.set('n', '<space>r', dap.run_last, mapopts)

--------------------------------- dap core ------------------------------------

dap.adapters.python = {
  type = 'executable';
  command = 'python3';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = "python3",
  }
}


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
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
