local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>C-f", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>@", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, {})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"git",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})
