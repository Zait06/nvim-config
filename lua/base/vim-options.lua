-- Basic settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set splitbelow")
vim.cmd("set splitright")

vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true

--Mapping
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to right window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to left window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<C-w>b", ":bdelete!<CR>:bnext<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "//", ":noh<CR>")
vim.keymap.set("n", "<C-s>v", vim.cmd.vsplit, { desc = "Split vertially" })
vim.keymap.set("n", "<C-s>h", vim.cmd.split, { desc = "Split horizontally" })
vim.keymap.set("n", "<C-t>", ":split<CR>:ter<CR>:resize 7<CR>", { desc = "Open terminal" })
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "Open terminal" })
