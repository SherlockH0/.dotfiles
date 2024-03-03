return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- setup with some options
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				icons = {
					git_placement = "after",
					glyphs = {
						git = {
							untracked = "?",
							deleted = "󰧧",
							staged = "+",
							renamed = "»",
						},
					},
				},
			},
			filters = {
				dotfiles = true,
			},
		})

		-- set keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>o", "<cmd>NvimTreeToggle<CR>")
		keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>")
	end,
}
