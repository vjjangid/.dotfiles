--lua-set leader key to space
vim.g.mapleader = " "

--keymaps
local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit from insert mode" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split vertically" })
keymap.set("n", "<leader>sx", "<cmd>wq<CR>", { desc = "save and close split" })

-- keymap.set("n", "<leader>to", "<cmd>:tabnew<Enter>", { desc = "open new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>:tabclose<Enter>", { desc = "close current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>:tabn<Enter>", { desc = "move to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>:tabp<Enter>", { desc = "move to prev tab" })
-- keymap.set("n", "<leader>tf", "<cmd>:tabnew %<Enter>", { desc = "Open current buffer/file into new tab" })
--

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "move to down window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "move to up window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "move to right window" })

keymap.set("i", "<A-CR>", "<Esc>O", { desc = "Insert newline above without leaving insert mode" })
keymap.set("i", "<S-CR>", "<Esc>o", { desc = "Insert newline below without leaving insert mode" })

vim.keymap.set("n", "<leader>tx", function()
	-- Get list of listed buffers
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	local n = #buffers
	if n == 1 then
		-- Only one buffer left, delete it and open nvim-tree
		vim.cmd("bdelete")
		vim.cmd("NvimTreeOpen")
	else
		local current = vim.api.nvim_get_current_buf()
		-- Find next buffer (in tabline order, wraps around)
		local next_buf
		for i, buf in ipairs(buffers) do
			if buf.bufnr == current then
				-- if not last buffer, go to next; else go to prev
				if i < n then
					next_buf = buffers[i + 1].bufnr
				else
					next_buf = buffers[i - 1].bufnr
				end
				break
			end
		end
		-- Switch to next/prev buffer
		vim.api.nvim_set_current_buf(next_buf)
		-- Then delete the previous buffer
		vim.cmd("bdelete " .. current)
	end
end, { desc = "Delete current buffer and jump to the next/prev buffer or open NvimTree" })
