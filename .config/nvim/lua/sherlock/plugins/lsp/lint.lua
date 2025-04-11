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
			python = { "flake8", "snyk_iac", "pydocstyle" },
			django = { "djlint" },
			dockerfile = { "hadolint", "snyk_iac" },
			godot = { "gdtoolkit" },
			javascript = { "snyk_iac" },
			typescript = { "snyk_iac" },
		}
		local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_autogroup,
			callback = function()
				require("lint").try_lint()
				require("lint").try_lint("editorconfig-checker")
				require("lint").try_lint("misspell")
			end,
		})
		vim.keymap.set("n", "<leader>ll", require("lint").try_lint, {})
	end,
}
