local on_attach = function(client, bufnr)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })

	-- inlay hint
	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

capabilities = vim.tbl_deep_extend("force", capabilities, {
	textDocument = {
		definition = {
			dynamicRegistration = false,
			linkSupport = true,
		},
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
	offsetEncoding = { "utf-8", "utf-16" },
})

-- Biome
vim.lsp.config("biome", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Deno
vim.lsp.config("denols", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_markers = { "deno.json", "deno.jsonc" },
	workspace_required = true,
})

-- Go
vim.lsp.config("gopls", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Perl
vim.lsp.config("perlnavigator", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
vim.lsp.config("pyright", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

-- PHP
vim.lsp.config("phpactor", {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { vim.fn.expand("~") .. "/.config/composer/vendor/bin/phpactor", "language-server" },
})

-- Rust
vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- HTML
vim.lsp.config("html", {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/superhtml"), "lsp" },
})

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		-- denols との競合を避けるため、deno.json があるプロジェクトでは起動しない
		local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
		if deno_root then
			return nil
		end
		local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json", ".git" })
		if root then
			on_dir(root)
		end
	end,
	workspace_required = true,
})

-- Enable all configured LSP servers
vim.lsp.enable({
	"biome",
	"denols",
	"gopls",
	"perlnavigator",
	"pyright",
	"phpactor",
	"rust_analyzer",
	"html",
	"ts_ls",
	"gleam",
})
