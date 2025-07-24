return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()

			vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostics at cursor" })

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
			vim.keymap.set("v", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Action (Visual)" })
		end,
	},
}
