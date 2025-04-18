return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "packer", "NvimTree", "startup" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diagnostics" },
				lualine_c = { { "filename", path = 4, newfile_status = true } },
				lualine_x = { "branch" },
				lualine_y = { "filetype" },
				lualine_z = { "location", "progress" },
			},
			inactive_sections = {
				lualine_a = { { "filename", path = 4, newfile_status = true } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location", "progress" },
			},
		})
	end,
}
