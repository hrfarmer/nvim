require("aychar")
require("aychar.lazy")

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.autoindent = true

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

function InitializeThemeFile()
	local file = io.open(vim.fn.stdpath("config") .. "/.theme", "w")
	if file then
		file:write("dark\n")
		file:close()
	end

	vim.cmd("colorscheme github_dark_default")
end

local themeFile = io.open(vim.fn.stdpath("config") .. "/.theme", "r")
if themeFile then
	local theme = themeFile:read("*l")
	themeFile:close()

	if theme and #theme > 0 then
		if theme == "light" then
			vim.cmd("colorscheme github_light_default")
		else
			vim.cmd("colorscheme github_dark_default")
		end
	else
		InitializeThemeFile()
	end
else
	InitializeThemeFile()
end

vim.api.nvim_create_user_command("Theme", function(opts)
	local file = io.open(vim.fn.stdpath("config") .. "/.theme", "w")
	if file then
		if opts.fargs[1] == "light" then
			vim.cmd("colorscheme github_light_default")
			file:write("light\n")
		elseif opts.fargs[1] == "dark" then
			vim.cmd("colorscheme github_dark_default")
			file:write("dark\n")
		end
		vim.cmd("hi Normal ctermbg=none guibg=none")
		file:close()
	end
end, { nargs = 1 })

vim.cmd("hi Normal ctermbg=none guibg=none")
