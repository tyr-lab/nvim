return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = { "bold" },
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			integrations = {
				cmp = true,
				telescope = { enabled = true, style = "nvchad" },
				gitsigns = true,
				barbar = true,
				nvimtree = true,
				treesitter = true,
				which_key = true,
				noice = true,
				dap = true,
				blink_cmp = true,
				beacon = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				nvim_surround = true,
				rainbow_delimiters = true,
				illuminate = {
					enabled = true,
					lsp = false,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "flamingo",
					colored_indent_levels = false,
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
