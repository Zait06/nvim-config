return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup()
			vim.keymap.set("n", "<leader>gph", gitsigns.preview_hunk, { desc = "Preview hunk" })
		end,
	},
}
