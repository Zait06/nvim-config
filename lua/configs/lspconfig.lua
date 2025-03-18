local M = {}
local map = vim.keymap.set

local function mapping()
	local function opts(desc)
		return { desc = "LSP " .. desc }
	end
	map("n", "glD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gld", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gli", vim.lsp.buf.implementation, opts("Go to implementation"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	map("n", "glr", vim.lsp.buf.references, opts("Show references"))
end

-- export on_attach & capabilities
M.on_attach = function() end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.defaults = function()
	local lspconfig = require("lspconfig")

	mapping()

	lspconfig.lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/ui/nvim_types",
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

  -- cmake
  lspconfig.cmake.setup({
    capabilities = capabilities,
  })
end

return M
