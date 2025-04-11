vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

local group = vim.api.nvim_create_augroup("TwoSpaceTab", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "css,scss,rasi,html,htmldjango,svelte",
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

vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.showmode = false
vim.opt.wrap = false

vim.opt.cursorline = true

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.listchars = { tab = "→ ", nbsp = "␣", trail = "·" }

vim.api.nvim_command(
	"highlight UnicodeWhitespace term=reverse ctermfg=red ctermbg=NONE cterm=underline guifg=red guibg=NONE gui=reverse"
)
