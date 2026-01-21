return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter",
		opts = {
			highlight = { enable = true },
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			per_filetype = {
				["html"] = {
					enable_close = true,
				},
			},
		},
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "HiPhish/rainbow-delimiters.nvim" },
}
