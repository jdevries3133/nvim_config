-- Keyboard shortcuts are like a pair of fine leather shoes: the better they
-- fit to my feet, the more they'll stink for you! To make this config
-- friendly for forking, here are all the shortcuts I've defined
-- front-and-center.
--
-- I strongly recommend commenting out all of these if you fork my config. When
-- you are ready to learn part of my config, comment-in and learn one or two
-- shortcuts at a time. Ideally, CHANGE the actual shortcut to a value that
-- makes sense for you.

local M = {}

-- You can safely delete or comment-out any line here and the mapping will go
-- away; every mapping is conditionally applied only if it's present in this
-- table!
M.my_custom_shortcuts = {
  completion_next_suggestion = '<Tab>',
  completion_previous_suggestion = '<S-Tab>',
  completion_scroll_docs_back = '<C-b>',
  completion_scroll_docs_forward = '<C-f>',
  dadbod_ui_open = '<leader>db',
  dap_continue = '<space>c',
  dap_edit_item_in_ui_buffer = 'e',
  dap_float_scopes = '<space>v',
  dap_open_item_in_ui_buffer = 'o',
  dap_remove_item_in_ui_buffer = 'd',
  dap_repl_in_ui_buffer = 'r',
  dap_set_conditional_breakpoint = '<space>B',
  dap_step_into = '<space>s',
  dap_step_out = '<space>o',
  dap_step_over = '<space>n',
  dap_toggle_breakpoint = '<space>b',
  dap_toggle_in_ui_buffer = 't',
  dap_ui_close = '<space>C',
  dap_ui_open = '<space>O',
  dap_visual_mode_eval = '<space>v',
  lsp_diagnostic_goto_next = ']d',
  lsp_diagnostic_goto_prev = '[d',
  lsp_diagnostic_set_loclist = '<space>q',
  -- Note: the JavaScript ecosystem has no official code formatter so this
  -- formatting behavior of ts-server, which may not be the code formatter you
  -- might not work right. If you try to use this, it will dispatch to the
  -- want or use.
  lsp_format = '<leader>lf',
  lsp_goto_definition = 'gd',
  lsp_goto_references = 'gr',
  lsp_hover = 'K',
  lsp_open_float = '<leader>K',
  lsp_rename = '<leader>rn',
  lsp_restart = '<leader>l',
  telescope_buffers = '<leader>tb',
  telescope_colorscheme = '<leader>tc',
  telescope_find_files = '<leader>tf',
  telescope_resume = '<leader>tr',
  telescope_git_commits = '<leader>tc',
  telescope_git_status = '<leader>ts',
  telescope_jumplist = '<leader>tj',
  telescope_live_grep = '<leader>tg',
  telescope_lsp_diagnostics = '<leader>td',
  toggle_no_neck_pain = '<leader>nn'
}

-- Wrapper around `vim.keymap.set` that will automatically not apply the
-- shortcut if it is `nil`. At callsites, we generally apply the shortcuts in
-- the above table through this wrapper to make it easy for forkers to
-- get a good comment-out workflow for finding shortcuts that work for them.
--
-- Clearly, after you have forked and start to more personally adopt this
-- config, this indirection doesn't really continue to do you any good, unless
-- you want to become a neovim evangelist like myself.
function M.apply_shortcut(mode, shortcut, func, options)
  if shortcut then
    vim.keymap.set(mode, shortcut, func, options)
  end
end

return M
