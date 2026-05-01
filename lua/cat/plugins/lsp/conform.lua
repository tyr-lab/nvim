return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			-- Associate formatters by file type
			formatters_by_ft = {
				lua = { "stylua" }, -- Use 'stylua' for Lua files
				python = { "black", "isort" }, -- Use 'isort' and 'ruff' for Python files
				javascript = { "prettierd", "prettier" }, -- Use 'prettierd' and 'prettier' for JavaScript files
				json = { "prettierd", "prettier" },
			},

			-- Default options for formatting
			default_format_opts = {
				lsp_format = "fallback", -- Use LSP formatting as a fallback option
			},

			-- Format on save options
			format_on_save = {
				timeout_ms = 500, -- Maximum wait time (in milliseconds) for formatting on save
			},
		})
	end,
}
