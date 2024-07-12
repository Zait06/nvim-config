local opts = {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "rust",
    "cpp",
    "python",
    "yaml",
    "gitignore",
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

return  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
