return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"omnisharp",
			},
		})

		print(mason_lspconfig)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
		vim.keymap.set("v", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Action (Visual)" })
	end,
}
