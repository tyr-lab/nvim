return {
	-- https://github.com/mfussenegger/nvim-dap-python
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
	},
	config = function()
		local python = vim.fn.exepath("python3")
		if python == "" then
			vim.notify("python3 no esta disponible para nvim-dap-python", vim.log.levels.WARN)
			return
		end

		require("dap-python").setup(python)
	end,
}
