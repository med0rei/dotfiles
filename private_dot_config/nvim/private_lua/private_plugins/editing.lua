return {
	{
		"matze/vim-move",
		config = function()
			vim.g.move_key_modifier = "A"
			vim.g.move_key_modifier_visualmode = "A"
		end,
	},
	{ "skanehira/jumpcursor.vim" },
}
