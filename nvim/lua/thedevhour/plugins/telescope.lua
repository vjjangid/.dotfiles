return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  }, 
  config = function()
    require("telescope").load_extension("fzf")

    vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, {desc = "find files into root directory"})
  end
}
