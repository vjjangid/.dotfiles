return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  }, 
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("fzf")

    telescope.setup ({
      defaults = {
        file_ignore_patterns = {
		  "[\\/]%.git[\\/]",  -- .git on both Linux and Windows
 		  "[\\/]obj[\\/]",    -- obj folder on both Linux and Windows
         "[\\/]%.vs[\\/]",
         "[\\/]bin[\\/]",
         "[\\/]Binaries[\\/]",
         "[\\/]binaries[\\/]",
         "[\\/]docs[\\/]",
         "[\\/]build[\\/]",
		},
      },
    })

    vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "Find files in root directory" })
  end
}
