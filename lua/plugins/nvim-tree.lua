return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		opts = function()
			return require("configs.nvim-tree")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus, { desc = "Focus tree panel" })
			vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle, { desc = "Toggle tree panel" })
		end,
	},
}
