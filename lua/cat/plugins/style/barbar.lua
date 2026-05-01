return {
	"romgrk/barbar.nvim",
	lazy = false,
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = true,
		tabpages = true,
		clickable = true,
		no_name_title = "Empty",
		icons = {
			--button = " X ",
			filetype = {
				enabled = false,
			},
		},
		sidebar_filetypes = {
			NvimTree = true,
		},
	},
}
