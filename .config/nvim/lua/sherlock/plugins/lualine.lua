return {
	"nvim-lualine/lualine.nvim",
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
				lualine_c = { "buffers" },
				lualine_x = { "branch" },
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
