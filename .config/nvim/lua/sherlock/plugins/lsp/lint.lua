return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"rshkarin/mason-nvim-lint",
		"williamboman/mason.nvim",
	},
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			makefile = { "checkmake" },
			git = { "gitlint" },
			python = { "snyk_iac" },
			django = { "djlint" },
			dockerfile = { "hadolint", "snyk_iac" },
			godot = { "gdtoolkit" },
			javascript = { "snyk_iac" },
			typescript = { "snyk_iac" },
		}
		local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })
		local lint = require("lint")

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = lint_autogroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>ll", require("lint").try_lint, {})
	end,
}
