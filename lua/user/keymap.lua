vim.keymap.set("n", "H", function()
	local current_column = vim.fn.col(".")
	if current_column == 1 then
		vim.cmd.normal("_")
	else
		vim.fn.cursor(".", 1)
	end
end, { silent = true })
vim.keymap.set("n", "L", function()
	local current_column = vim.fn.col(".")
	local end_column = vim.fn.col("$") - 1
	if current_column == end_column then
		vim.cmd.normal("g_")
	else
		vim.fn.cursor(".", end_column)
	end
end, { silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--Navigation
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true })
-- Spell checking
vim.keymap.set("n", "<Leader>sc", ":set spell!<CR>", { silent = true })

-- NeoTree
vim.keymap.set("n", "<Leader>f", ":Neotree toggle=true reveal <CR>", { silent = true })
--NavBuddy
vim.keymap.set("n", "<Leader>o", ":Navbuddy<CR>", { silent = true }) --Outline symbols

--Write
vim.keymap.set({ "n" }, "<C-s>", ":w<CR>", { silent = true })

--CodeRunner
vim.keymap.set("n", "<Leader>rr", ":RunCode<CR>", { silent = true })
vim.keymap.set("n", "<Leader>rp", ":RunProject<CR>", { silent = true })

--dap

-- System clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>p", [["+p]], { silent = true })

--TODO nvim
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords
-- vim.keymap.set("n", "]t", function()
-- 	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
-- end, { desc = "Next error/warning todo comment" })
--Barbar
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', { silent = true })
vim.keymap.set('n', '<C-c>', '<Cmd>BufferClose<CR>', { silent = true })
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '[b', '<Cmd>BufferPrevious<CR>', opts)
map('n', ']b', '<Cmd>BufferNext<CR>', opts)
-- Goto buffer in position...
map('n', '<Leader>bf', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Leader>bl', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<Leader>bp', '<Cmd>BufferPin<CR>', opts)
-- Sort automatically by...
-- Leap
-- vim.keymap.del({ 'x', 'o' }, 'x')
-- vim.keymap.del({ 'x', 'o' }, 'X')
--
--
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').current_buffer_fuzzy_find,
  { desc = '[space] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sdd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
