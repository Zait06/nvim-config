local opts = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "clangd",
    "clang-format",
    "pyright",
    "eslint_d",
  },
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
    config = function()
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      -- clangd
      lspconfig.clangd.setup({
        on_attach = function(client, _)
          client.server_capabilities.signatureHelpProvider = false
        end,
        capabilities = capabilities,
      })

      -- python
      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
      })

      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- typescript
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
    end,
  },
}
