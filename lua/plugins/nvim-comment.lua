return {
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
			vim.keymap.set("n", "<leader>/", "gcc", { desc = "Comment toggle", remap = true })
			vim.keymap.set("v", "<leader>/", "gc", { desc = "Comment toggle", remap = true })
		end,
	},
}
