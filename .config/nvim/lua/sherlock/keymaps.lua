local set = vim.keymap.set

vim.g.mapleader = " "

set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("x", "<leader>p", [["_dP]])

set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me canceled
set("i", "<C-c>", "<Esc>")

set("n", "Q", "<nop>")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("v", "<leader>s", '"hy:%s/<C-r>h/<C-r>h/gc<left><left><left>')
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

set("n", "]b", "<cmd> bnext!<cr>")
set("n", "[b", "<cmd> bprevious!<cr>")
set("n", "[q", "<cmd> bd<cr>")

-- Change detect file type
set("n", "<leader>r", "<cmd>filetype detect<CR>")

set("n", "<leader>gv", "<cmd>Flog<CR>")
