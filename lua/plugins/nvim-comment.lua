return {
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
			vim.keymap.set("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
			vim.keymap.set("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })
		end,
	},
}
