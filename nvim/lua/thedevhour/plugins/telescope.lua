return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf")

		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"[\\/]%.git[\\/]", -- .git on both Linux and Windows
					"[\\/]obj[\\/]", -- obj folder on both Linux and Windows
					"[\\/]%.vs[\\/]",
					"[\\/]bin[\\/]",
					"[\\/]Binaries[\\/]",
					"[\\/]binaries[\\/]",
					"[\\/]docs[\\/]",
					"[\\/]build[\\/]",
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set(
			"n",
			"<space>fd",
			require("telescope.builtin").find_files,
			{ desc = "Find files in root directory" }
		)
		--in windows you need to scoop rg grep
		vim.keymap.set(
			"n",
			"<space>fgd",
			require("telescope.builtin").live_grep,
			{ desc = "search strings in root directory" }
		)
		vim.keymap.set(
			"n",
			"<leader>fgc",
			require("telescope.builtin").current_buffer_fuzzy_find,
			{ desc = "Search in current buffer" }
		)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

		vim.keymap.set(
			"n",
			"<leader>ldf",
			require("telescope.builtin").diagnostics,
			{ desc = "Show diagnostics for all files" }
		)

		vim.keymap.set("n", "<leader>ldb", function()
			require("telescope.builtin").diagnostics({ bufnr = 0 })
		end, { desc = "Show diagnostics in current buffer" })

		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementation" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Go to references" })
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to references" })
	end,
}
