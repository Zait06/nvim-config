return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavor = 'macchiato',
      background = {
        light = "macchiato",
        dark = "macchiato",
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
      styles = {
        types = { "bold" },
        functions = { "italic" }
      }
    })
    vim.cmd.colorscheme('catppuccin')
  end,
}
