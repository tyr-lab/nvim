-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "saghen/blink.cmp" },
	},
	config = function()
		require("mason").setup()

		local function find_python(root_dir)
			local candidates = {
				root_dir and (root_dir .. "/.venv/bin/python"),
				root_dir and (root_dir .. "/venv/bin/python"),
				vim.env.VIRTUAL_ENV and (vim.env.VIRTUAL_ENV .. "/bin/python"),
			}

			for _, path in ipairs(candidates) do
				if path and vim.fn.executable(path) == 1 then
					return path
				end
			end

			local python = vim.fn.exepath("python3")
			if python ~= "" then
				return python
			end

			return vim.fn.exepath("python")
		end

		local servers = {
			"bashls",
			"cssls",
			"html",
			"ts_ls",
			"lua_ls",
			"jsonls",
			"pyright",
			"ruff",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_enable = false,
		})

		local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

		local map = function(mode, lhs, rhs, desc, bufnr)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		local lsp_attach = function(client, bufnr)
			map("n", "K", vim.lsp.buf.hover, "LSP hover", bufnr)
			map("n", "gd", vim.lsp.buf.definition, "LSP goto definition", bufnr)
			map("n", "gD", vim.lsp.buf.declaration, "LSP goto declaration", bufnr)
			map("n", "gi", vim.lsp.buf.implementation, "LSP goto implementation", bufnr)
			map("n", "gr", vim.lsp.buf.references, "LSP references", bufnr)
			map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename", bufnr)
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action", bufnr)
			map("n", "<leader>fd", vim.diagnostic.open_float, "Line diagnostics", bufnr)
			map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic", bufnr)
			map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic", bufnr)

			if client.name == "ruff" then
				client.server_capabilities.hoverProvider = false
			end
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
			root_markers = { ".venv", "venv", "pyproject.toml", "requirements.txt", "requirements-dev.txt", ".git" },
			before_init = function(_, config)
				config.settings = config.settings or {}
				config.settings.python = config.settings.python or {}
				config.settings.python.pythonPath = find_python(config.root_dir)
			end,
			settings = {
				pyright = {},
				python = {},
			},
		})

		vim.lsp.config("ruff", {
			root_markers = { ".venv", "venv", "pyproject.toml", "requirements.txt", "requirements-dev.txt", ".git" },
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = true,
			virtual_text = {
				spacing = 2,
				prefix = "●",
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
