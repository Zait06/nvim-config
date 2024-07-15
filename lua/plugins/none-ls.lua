return {
	{
		"nvimtools/none-ls.nvim",
		opts = function()
			return require("configs.none-ls")
		end,
		config = function(_, opts)
			local null_ls = require("null-ls")
			null_ls.setup(opts)
			vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
		end,
	},
}
