return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				cs = { "csharpier" }, -- Ensure C# files use the 'csharpier' formatter
			},
			formatters = {
				csharpier = {
					command = "csharpier",
					args = {
						"format",
						"--write-stdout",
					},
					to_stdin = true,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000, -- Increased timeout as C# formatting can be slower
			},
		})
	end,
}
