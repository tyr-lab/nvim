return {
	"folke/which-key.nvim",
	keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	event = "VeryLazy",
	cmd = "WhichKey",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}
