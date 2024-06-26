return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					require("formatter.filetypes.python").autoflake,
					require("formatter.filetypes.python").black,
					require("formatter.filetypes.python").isort,
				},
				javascript = { require("formatter.defaults.prettier") },
				typescript = { require("formatter.defaults.prettier") },
				css = { require("formatter.defaults.prettier") },
				scss = { require("formatter.defaults.prettier") },
				less = { require("formatter.defaults.prettier") },
				markdown = { require("formatter.defaults.prettier") },
				vue = { require("formatter.defaults.prettier") },
				yaml = { require("formatter.defaults.prettier") },
				json = { require("formatter.defaults.prettier") },
				jsx = { require("formatter.defaults.prettier") },
				angular = { require("formatter.defaults.prettier") },
				flow = { require("formatter.defaults.prettier") },
				graphql = { require("formatter.defaults.prettier") },
				html = { require("formatter.defaults.prettier") },
				htmldjango = {
					function()
						return {
							exe = "djlint",
							args = { "--reformat", "-", "--indent 2" },
							stdin = true,
						}
					end,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})

		-- set keymaps
		local keymap = vim.keymap
		keymap.set({ "n", "i" }, "<A-f>", "<cmd>Format<CR>")
	end,
}
