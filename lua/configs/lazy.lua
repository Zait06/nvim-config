return {
{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme('catppuccin-macchiato')
	end,
},
{
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = function()
		return require "configs.telescope"
	end,
},
{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = function()
		return require("configs.nvim-treesitter")
	end,
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
},
{
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
	opts = function()
		return require("configs.mason")
	end,
	config = function(_, opts)
		require("mason").setup(opts)
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end
		end, {})
		vim.g.mason_binaries_list = opts.ensure_installed
	end,
},
{ "williamboman/mason-lspconfig.nvim" },
{
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		require("configs.lspconfig")
	end,
},
{
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		return require("configs.nvim-tree")
	end,
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
},
{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup{}
		end,
},
{
    'freddiehaddad/feline.nvim',
	config = function()
		require('feline').setup()
	end,
}
}
