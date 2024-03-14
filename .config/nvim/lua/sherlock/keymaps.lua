local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "Q", "<nop>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

keymap.set("n", "<c-]>", "<cmd> bnext<cr>")
keymap.set("n", "<c-[>", "<cmd> bprevious<cr>")
keymap.set("n", "<c-q>", "<cmd> bd<cr>")
