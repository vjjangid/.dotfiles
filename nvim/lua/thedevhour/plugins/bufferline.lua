return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup()
		-- Keymaps for buffer navigation
		vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
		vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
	end,
}
