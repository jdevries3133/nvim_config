-- Keyboard shortcuts are like a pair of fine leather shoes: the better they
-- fit to my feet, the more they'll stink for you!
--
-- To make this config friendly for forking, here are all the shortcuts I've
-- defined front-and-center. Some are fairly non-controversial, while others
-- are more uniquely suited to my workflow.

local M = {}

-- You can delete or comment-out any line here and the mapping will go away;
-- every mapping is conditionally applied only if it's present in this table!
M.my_custom_shortcuts = {
  completion_scroll_docs_forward = '<C-f>',
  completion_scroll_docs_back = '<C-b>',
  completion_next_suggestion = '<Tab>',
  completion_previous_suggestion = '<S-Tab>',
  dadbod_ui_open = '<leader>db',
  dap_toggle_breakpoint = '<space>b',
  dap_set_conditional_breakpoint = '<space>B',
  dap_continue = '<space>c',
  dap_step_over = '<space>n',
  dap_step_into = '<space>s',
  dap_step_out = '<space>o',
  dap_ui_close = '<space>C',
  dap_ui_open = '<space>O',
  dap_open_item_in_ui_buffer = 'o',
  dap_remove_item_in_ui_buffer = 'd',
  dap_edit_item_in_ui_buffer = 'e',
  dap_repl_in_ui_buffer = 'r',
  dap_toggle_in_ui_buffer = 't',
  dap_float_scopes = '<space>v',
  dap_visual_mode_eval = '<space>v',
  lsp_diagnostic_goto_next = ']d',
  lsp_diagnostic_goto_prev = '[d',
  lsp_diagnostic_set_loclist = '<space>q',
  lsp_goto_definition = 'gd',
  lsp_goto_references = 'gr',
  lsp_hover = 'K',
  -- Note: the JavaScript ecosystem has no official code formatter so this
  -- might not work right. If you try to use this, it will dispatch to the
  -- formatting behavior of ts-server, which may not be the code formatter you
  -- want or use.
  lsp_format = '<leader>lf',
  lsp_open_float = '<leader>K',
  lsp_restart = '<leader>l',
  lsp_rename = '<leader>rn',
  telescope_find_files = '<leader>tf',
  telescope_live_grep = '<leader>tg',
  telescope_buffers = '<leader>tb',
  telescope_jumplist = '<leader>tj',
  telescope_git_commits = '<leader>tc',
  telescope_git_branches = '<leader>tr',
  telescope_lsp_diagnostics = '<leader>td',
  telescope_colorscheme = '<leader>tc',
  telescope_git_status = '<leader>ts',
  toggle_no_neck_pain = '<leader>nn'
}

-- Wrapper around `vim.keymap.set` that will automatically not apply the
-- shortcut if it is `nil`. This is good for using shortcuts from the above
-- mapping, because they will become automatically "disabled" in a uniform way
-- if the line from the mapping is simply deleted or commented-out
--
-- Note that there are some consumers who do not use these shortcuts via this
-- utility. For example, ./cmp_conf.lua, where the configuration pattern does
-- not use `vim.keymap.set`
function M.apply_shortcut(mode, shortcut, func, options)
  if shortcut then
    vim.keymap.set(mode, shortcut, func, options)
  end
end

return M
