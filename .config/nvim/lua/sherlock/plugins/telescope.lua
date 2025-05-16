return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"Snikimonkd/telescope-git-conflicts.nvim",
	},
	opts = {
		defaults = {
			mappings = {
				n = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				}, -- n
				i = {
					["<C-h>"] = "which_key",
					["<c-d>"] = require("telescope.actions").delete_buffer,
				}, -- i
			}, -- mappings
		},
	},
	init = function()
		require("telescope").load_extension("conflicts")
	end,
	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files },
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({
					sort_mru = true,
					ignore_current_buffer = true,
				})
			end,
		},
		{ "<leader>fg", require("telescope.builtin").live_grep },
		{ "<leader>ft", require("telescope.builtin").resume },
		{ "<leader>fl", require("telescope").extensions.aerial.aerial },
		{ "<leader>fc", "<cmd>Telescope conflicts<cr>" },
		{ "<leader>fd", require("telescope.builtin").diagnostics },
		{
			"<leader>fj",
			function()
				if not pcall(require("telescope.builtin").git_files) then
					print("Can't find git")
				end
			end,
		},
		{ "<leader>fo", require("telescope.builtin").oldfiles },
	},
}
