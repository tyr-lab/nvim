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
		local servers = {
			"bashls",
			"cssls",
			"html",
			"lua_ls",
			"jsonls",
			"quick_lint_js",
			"pyright",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_enable = false,
		})

		local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		vim.lsp.config("*", {
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("pyright", {
			settings = {
				pyright = {},
				python = {},
			},
		})

		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
