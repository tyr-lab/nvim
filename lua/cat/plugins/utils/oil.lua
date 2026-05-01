return {
	"stevearc/oil.nvim",
	cmd = { "Oil" },
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 2,
			max_width = 90,
			max_height = 0,
			border = "rounded",
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
