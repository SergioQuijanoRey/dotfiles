local exec = require("myconf/aux").exec

--- Leader key
--- Set it first because other modules should need this keymap to be set beforehand
--- ======================================================================== ---
vim.g.mapleader = ","

--- Editor settings
--- ======================================================================== ---
vim.opt.autoindent = true                        -- Sets autoindent
vim.opt.smartindent = true                       -- Set smartindent
vim.opt.incsearch = true                         -- Shows results while searching
vim.opt.backspace = { "indent", "eol", "start" } -- Normal backspace (for VI specially)
vim.opt.mouse = "a"                              -- Allow mouse control
vim.opt.undofile = true                          -- Persisten undos (I can undo even if I closed the file)
vim.opt.encoding = "utf-8"                       -- Type of encoding
vim.opt.ignorecase = true                        -- When searching, ignore upper or lower case
vim.opt.scrolloff = 4                            -- Start scrolling before getting to last line
vim.opt.cursorline = true                        -- Highlight the current line

-- Four spaces instead of tab
exec("filetype plugin indent on")
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Remove trailing white spaces when saving file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

-- Without this, when pasting in visual mode, what we got on the clipboard gets lost
-- This way we can paste in visual mode multiple times without the need t
-- recopying it again and again
exec([[xnoremap <expr> p 'pgv"'.v:register.'y`>']])
exec([[xnoremap <expr> P 'Pgv"'.v:register.'y`>']])

-- Splitting where i want
vim.opt.splitbelow = true
vim.opt.splitright = true

--- Performance
--- ======================================================================== ---

-- Auto reload changed files
vim.opt.autoread = true

-- Get rid of swap/backup files
exec("set noswapfile")

--- Use system clipboard instead of nvim registers
vim.opt.clipboard = 'unnamedplus'

--- Visual settings
--- ======================================================================== ---

-- Basic neovim visual settings
vim.opt.number = true -- Show numbers
vim.opt.hlsearch = true -- Higlights what we searched
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.listchars.extends = → -- Show arrow if line continues rightwards
vim.opt.colorcolumn = { 80 } -- Show column line
vim.opt.guicursor = "" -- Block cursor

--- Load all my config files
--- ======================================================================== ---
require("myconf")
