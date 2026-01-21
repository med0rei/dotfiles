return {
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
		config = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "default",
					["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "fallback" },
					["<CR>"] = { "accept", "fallback" },
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = {
					menu = {
						border = "single",
					},
					documentation = {
						auto_show = true,
						window = { border = "single" },
					},
					ghost_text = { enabled = true },
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				snippets = { preset = "default" },
				fuzzy = { implementation = "prefer_rust_with_warning" },
			})
		end,
	},
	{
		"cohama/lexima.vim",
		config = function()
			local artemis = require("artemis")
		end,
	},
}
