-- Basic keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigation
vim.keymap.set('n', 'H', function()
  local current_column = vim.fn.col '.'
  if current_column == 1 then
    vim.cmd.normal '_'
  else
    vim.fn.cursor('.', 1)
  end
end, { silent = true })

vim.keymap.set('n', 'L', function()
  local current_column = vim.fn.col '.'
  local end_column = vim.fn.col '$' - 1
  if current_column == end_column then
    vim.cmd.normal 'g_'
  else
    vim.fn.cursor('.', end_column)
  end
end, { silent = true })

vim.keymap.set('i', '<C-l>', '<Right>', { silent = true })

-- Save file
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })

-- System clipboard
vim.keymap.set({ 'n', 'v' }, '<Leader>y', [["+y]], { silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>p', [["+p]], { silent = true })

-- Diagnostic keymaps
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Plugin keymaps
vim.keymap.set('n', '<Leader>sp', ':set spell!<CR>', { silent = true })
vim.keymap.set('n', '<Leader>rr', ':RunCode<CR>', { silent = true })
vim.keymap.set('n', '<Leader>rp', ':RunProject<CR>', { silent = true })

-- TODO comments
vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- Buffer management (Barbar)
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', { silent = true })
vim.keymap.set('n', '<C-c>', '<Cmd>BufferClose<CR>', { silent = true })
vim.keymap.set('n', '[b', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', ']b', '<Cmd>BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<Leader>bf', '<Cmd>BufferGoto 1<CR>', { silent = true })
vim.keymap.set('n', '<Leader>bl', '<Cmd>BufferLast<CR>', { silent = true })
vim.keymap.set('n', '<Leader>bp', '<Cmd>BufferPin<CR>', { silent = true })

-- Treesitter context
vim.keymap.set('n', '[c', function()
  require('treesitter-context').go_to_context(vim.v.count1)
end, { silent = true, desc = 'Go to context' })
