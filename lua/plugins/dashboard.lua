return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")
			dashboard.section.header.val = require("ascii").art.text.neovim.dos_rebel
			alpha.setup(dashboard.config)
		end,
	},
}
