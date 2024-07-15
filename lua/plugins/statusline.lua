return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		return require("configs.statusline")
	end,
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
