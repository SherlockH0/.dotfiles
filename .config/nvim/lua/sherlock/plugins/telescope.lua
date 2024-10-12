return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope-media-files.nvim" },
	config = function()
		require("telescope").load_extension("media_files")
		require("telescope").setup({
			extensions = {
				media_files = {
					filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
				},
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fj", function()
			if not pcall(builtin.git_files) then
				print("Can't find git")
			end
		end, {})
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
		vim.keymap.set("n", "<leader>fm", require("telescope").extensions.media_files.media_files, {})
	end,
}
