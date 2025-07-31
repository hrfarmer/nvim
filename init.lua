require("aychar")
require("aychar.lazy")

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.autoindent = true

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "sql" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

vim.cmd("colorscheme github_dark_default")

local function apply_theme()
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
		end
	else
		vim.cmd("colorscheme github_dark_default")
	end
	vim.cmd("hi Normal ctermbg=none guibg=none")
end

-- apply_theme()
--
-- local theme_watcher = vim.loop.new_fs_event()
-- theme_watcher:start(
-- 	vim.fn.stdpath("config") .. "/.theme",
-- 	{},
-- 	vim.schedule_wrap(function()
-- 		apply_theme()
-- 	end)
-- )

vim.cmd("hi Normal ctermbg=none guibg=none")
