--- NeoVIM config written in lua

--- Leader key
--- Set it first because other modules should need this keymap to be set beforehand
--- ======================================================================== ---
vim.g.mapleader = ","

--- Load other lua config files
--- ======================================================================== ---

-- Where I manage plugins
-- Has to be before the other requires in order to first install packages and
-- then configure them using lua
require("myconf/packer")
require("myconf/treesitter")
require("myconf/telescope")
require("myconf/lsp")
require("myconf/completion")
require("myconf/keybindings")

--- Aux functions
--- ======================================================================== ---

local exec = require("myconf/aux").exec

--- Editor settings
--- ======================================================================== ---
vim.opt.autoindent = true                       -- Sets autoindent
vim.opt.smartindent = true                      -- Set smartindent
vim.opt.incsearch = true                        -- Shows results while searching
vim.opt.backspace = {"indent", "eol", "start"}  -- Normal backspace (for VI specially)
vim.opt.mouse="a"                               -- Allow mouse control
vim.opt.undofile = true                         -- Persisten undos (I can undo even if I closed the file)
vim.opt.encoding="utf-8"                        -- Type of encoding
vim.opt.ignorecase = true                       -- When searching, ignore upper or lower case
vim.opt.scrolloff=4                             -- Start scrolling before getting to last line

-- Four spaces instead of tab
exec("filetype plugin indent on", false)
vim.opt.smarttab=true                           -- Set smarttab
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

-- Remove trailing white spaces when saving file
exec([[autocmd BufWritePre * %s/\s\+$//e]], false)

--- Performance
--- ======================================================================== ---
vim.opt.autoread = true                                    -- Auto reload changed files
exec("autocmd! bufwritepost init.lua source %", false)     -- Auto compile when changing nvim config file
exec("autocmd! bufwritepost .nvimrc source %", false)      -- Auto compile when changing nvim config file

-- Get rid of swap/backup files
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.noswapfile = true

--- Clipboard
-- TODO --- FIXME
-- Write this in the lua way
exec(":set clipboard+=unnamedplus", false)

-- Avoid flashy terminal
exec("au TermEnter * setlocal scrolloff=0", false)
exec("au TermLeave * setlocal scrolloff=10", false)

--- Visual Settings
--- ======================================================================== ---
vim.opt.number = true               -- Show numbers
exec("syntax enable", false)        -- Show syntax
exec("syntax on", false)            -- Show syntax
exec("filetype on", false)          -- Checks automatically for filetype
exec("filetype plugin on", false)   -- Plugins dependent of filetype
vim.opt.hlsearch = true             -- Higlights what we searched
vim.opt.wrap = false                -- Don't wrap long lines
vim.opt.listchars.extends=→         -- Show arrow if line continues rightwards
vim.opt.colorcolumn={100}           -- Show 100 col line
vim.opt.guicursor = ""              -- Block cursor
vim.optloaded_matchparen = 1        -- No matching parenthesis/brakets/... highlight
vim.opt.termguicolors = true        -- Colorschemes dont work well without this
vim.opt.background="dark"           -- Dark background, does nothing with gruvbox colorscheme
exec("colorscheme onedark")         -- No vim.opt or vim.g for this

-- Splitting where i want
vim.opt.splitbelow = true
vim.opt.splitright = true
