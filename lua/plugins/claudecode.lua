local toggle_key = "<C-,>"
return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = true,
	opts = {
		terminal = {
			---@module "snacks"
			---@type snacks.win.Config|{}
			snacks_win_opts = {
				position = "float",
				width = 0.8,
				height = 0.8,
				keys = {
					claude_hide = {
						toggle_key,
						function(self)
							self:hide()
						end,
						mode = "t",
						desc = "Hide",
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>c",   nil,                              desc = "AI/Claude Code" },
		{ "<leader>cc",  "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
		{ "<leader>cf",  "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
		{ "<leader>ccr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
		{ "<leader>ccc", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>cm",  "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>cb",  "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
		{ "<leader>cs",  "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
		{
			"<leader>cs",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "neo-tree" },
		},
		-- Diff management
		{ "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
		{ toggle_key,   "<cmd>ClaudeCodeFocus<cr>",      desc = "Claude Code", mode = { "n", "x" } },
	},
}
