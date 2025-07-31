local js_formatters = { "prettierd", "prettier" }
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "go fmt" },
		-- python = { "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = js_formatters,
		typescript = js_formatters,
		javascriptreact = js_formatters,
		typescriptreact = js_formatters,
		json = js_formatters,
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
