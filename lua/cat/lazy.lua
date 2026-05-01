local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy.nvim to the runtime path so Neovim can load it
vim.opt.rtp:prepend(lazypath)

-- Configure and set up lazy.nvim with specific options
require("lazy").setup({
	{ import = "cat.plugins" },
	{ import = "cat.plugins.style" },
	{ import = "cat.plugins.git" },
	{ import = "cat.plugins.python" },
	{ import = "cat.plugins.lsp" },
	{ import = "cat.plugins.utils" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
