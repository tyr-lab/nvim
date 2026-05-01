-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },

		-- Auto-Install LSPs, linters, formatters, debuggers
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		--{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

		{ "rshkarin/mason-nvim-lint" },
		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim", opts = {} },
		{ "zapling/mason-conform.nvim" },
		{ "saghen/blink.cmp" },
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			-- Install these LSPs automatically
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"lua_ls",
				"jsonls",
				"quick_lint_js",
				"pyright",
			},
		})

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

		--require("cmp_nvim_lsp").default_capabilities()

		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					on_attach = lsp_attach,
					capabilities = lsp_capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,
			["pyright"] = function()
				lspconfig.pyright.setup({
					on_attach = lsp_attach,
					capabilities = lsp_capabilities,
					settings = {
						pyright = {},
						python = {},
					},
				})
			end,
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_attach,
					capabilities = lsp_capabilities,
				})
			end,
		})

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
