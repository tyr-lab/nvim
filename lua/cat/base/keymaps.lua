local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>tn", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>tr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

	map("n", "<leader>fm", function()
		require("conform").format({ lsp_fallback = true })
	end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
	map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
	map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
	map("n", "<leader>pt", "<cmd>Telescope builtin<CR>", { desc = "telescope builtins" })
	map("n", "<leader>nh", "<cmd>Noice history<CR>", { desc = "noice history" })
	map("n", "<leader>nd", "<cmd>Noice dismiss<CR>", { desc = "dismiss notifications" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- Barbar
map("n", "<Tab>", ":BufferNext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Previous Buffer" })
map("n", "<leader>x", ":BufferClose<CR>", { desc = "Delete Buffer" })

	-- oil
	map("n", "<C-n>", "<cmd>Oil<CR>", { desc = "open parent directory" })
	map("n", "<leader>e", "<cmd>Oil<CR>", { desc = "open file explorer" })
	map("n", "-", "<cmd>Oil<CR>", { desc = "open parent directory" })
