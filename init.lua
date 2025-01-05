require("aychar")
require("aychar.lazy")

vim.cmd("colorscheme github_dark_default")
vim.cmd("hi Normal ctermbg=none guibg=none")
vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.autoindent = true

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
