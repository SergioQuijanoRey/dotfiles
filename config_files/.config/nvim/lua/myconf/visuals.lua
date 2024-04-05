-- Config file for some visual settings

-- Basic neovim visual settings
vim.opt.number = true -- Show numbers
vim.opt.hlsearch = true -- Higlights what we searched
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.listchars.extends = → -- Show arrow if line continues rightwards
vim.opt.colorcolumn = { 80 } -- Show column line
vim.opt.guicursor = "" -- Block cursor
vim.optloaded_matchparen = 1 -- No matching parenthesis/brakets/... highlight
vim.opt.termguicolors = true -- Colorschemes dont work well without this
vim.opt.background = "dark" -- Dark background, does nothing with gruvbox colorscheme
