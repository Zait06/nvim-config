-- Basic settings

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
vim.keymap.set("n", "<C-w>", vim.cmd.bdelete)

vim.bo.tabstop = 4
vim.opt.clipboard = "unnamedplus"

require("base.plugins.lazy")
