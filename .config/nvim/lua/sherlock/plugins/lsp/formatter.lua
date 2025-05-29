return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			sql = { "sqlfmt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			vue = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			svelte = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			htmldjango = { "prettierd", "djlint" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			lua = { "stylua" },
			python = { "isort", "black", "autoflake" },
			gdscript = { "gdformat" },
			toml = { "taplo" },
		},
		format_after_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 2000, lsp_fallback = true, async = true }
		end,
		formatters = {
			djlint = {
				prepend_args = { "--reformat", "--indent=2" },
			},
		},
	},

	keys = {
		{
			mode = { "n", "v", "i" },
			"<M-f>",
			function()
				require("conform").format({
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
				})
			end,
			desc = "Format file or range (in visual mode)",
		},
	},
	init = function()
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
				print("Fromatter disabled for this buffer!")
			else
				vim.g.disable_autoformat = true
				print("Fromatter disabled!")
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
			print("Fromatter enabled!")
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
