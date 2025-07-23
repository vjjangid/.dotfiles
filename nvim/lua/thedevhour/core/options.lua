--options
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.wrap = false
opt.cursorline = true

-- tabs and indentations
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.tabstop = 2    -- 2 spaces on tab press
opt.expandtab = true
opt.autoindent = true

--copy clipboard
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus")

opt.ignorecase = true
opt.splitbelow = true
