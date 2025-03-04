return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enable = false,
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
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
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 5000, lsp_format = "fallback" }
			end,
		})
		require("conform").formatters.djlint = {
			prepend_args = { "--reformat", "--indent=2" },
		}

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
		vim.keymap.set({ "n", "v", "i" }, "<Alt>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
