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

vim.g.mapleader = " "

vim.wo.relativenumber = true
vim.wo.number = true

--Mapping

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<C-w>", ":bdelete | :bprevious<CR>")
vim.keymap.set("n", "//", ":noh<CR>")

require("base.plugins.lazy")
