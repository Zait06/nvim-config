local null_ls = require("null-ls")

return {
	sources = {
		-- lua
		null_ls.builtins.formatting.stylua,
		-- c/c++
		null_ls.builtins.formatting.clang_format,
		-- js/ts
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.erb_lint,
		--python
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.mypy,
	},
}
