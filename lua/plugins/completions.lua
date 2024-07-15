return {
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("configs.completions")
    end,
    config = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("cmp").setup(opts)
    end,
  },
}
