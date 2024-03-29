--- NeoVIM config written in lua

--- Leader key
--- Set it first because other modules should need this keymap to be set beforehand
--- ======================================================================== ---
vim.g.mapleader = ","

--- Load all my config files
--- ======================================================================== ---
require("myconf")

--- Aux functions
--- ======================================================================== ---

local exec = require("myconf/aux").exec

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
vim.opt.smarttab = true -- Set smarttab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Spaces per tab, for certain filetypes
exec("autocmd FileType dart setlocal shiftwidth=2 softtabstop=2 expandtab")

-- Remove trailing white spaces when saving file
exec([[autocmd BufWritePre * %s/\s\+$//e]])

-- Add spaces after comment delimiters by default
exec([[let g:NERDSpaceDelims = 1]])

-- Without this, when pasting in visual mode, what we got on the clipboard gets lost
-- This way we can paste in visual mode multiple times without the need t
-- recopying it again and again
exec([[xnoremap <expr> p 'pgv"'.v:register.'y`>']])
exec([[xnoremap <expr> P 'Pgv"'.v:register.'y`>']])

--- Performance
--- ======================================================================== ---
vim.opt.autoread = true                         -- Auto reload changed files
exec("autocmd! bufwritepost init.lua source %") -- Auto compile when changing nvim config file

-- Get rid of swap/backup files
exec("set noswapfile")

--- Use system clipboard instead of nvim registers
vim.opt.clipboard = 'unnamedplus'

--- Others
--- ======================================================================== ---

-- Splitting where i want
vim.opt.splitbelow = true
vim.opt.splitright = true
