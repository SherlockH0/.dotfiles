vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

local group = vim.api.nvim_create_augroup("TwoSpaceTab", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "css,scss,rasi,html,htmldjango",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
	group = group,
})

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.showmode = false
vim.opt.wrap = false

-- Toggle inline fold when opening .html
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.html", "*.tsx" },
	callback = function(_)
		if not require("inline-fold.module").isHidden then
			vim.cmd("InlineFoldToggle")
		end
	end,
})
