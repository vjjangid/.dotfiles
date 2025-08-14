return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				-- You can add more bufferline options here, if desired
			},
		})
		-- Keymaps for buffer navigation
		vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
		vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		--vim.keymap.set("n", "tx", "<cmd>bdelete<CR>", { desc = "delete current buffer" })
	end,
}
