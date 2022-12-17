--- NeoVIM config written in lua

--- Leader key
--- Set it first because other modules should need this keymap to be set beforehand
--- ======================================================================== ---
vim.g.mapleader = ","

-- Speed startup time
require("impatient")

--- Load other lua config files
--- ======================================================================== ---

-- Where I manage plugins
-- Has to be before the other requires in order to first install packages and
-- then configure them using lua
require("myconf/packer")
require("myconf/treesitter")
require("myconf/telescope")
require("myconf/lsp")
require("myconf/snippets")
require("myconf/completion")
require("myconf/keybindings")
require("myconf/autopairs")
require("myconf/status_line")
require("myconf/slime")
require("myconf/debugging")

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
exec("filetype plugin indent on")
vim.opt.smarttab=true                           -- Set smarttab
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

-- Spaces per tab, for certain filetypes
exec("autocmd FileType dart setlocal shiftwidth=2 softtabstop=2 expandtab")

-- Remove trailing white spaces when saving file
exec([[autocmd BufWritePre * %s/\s\+$//e]], false)

--- Performance
--- ======================================================================== ---
vim.opt.autoread = true                                    -- Auto reload changed files
exec("autocmd! bufwritepost init.lua source %")     -- Auto compile when changing nvim config file

-- Get rid of swap/backup files
exec("set noswapfile")

--- Use system clipboard instead of nvim registers
vim.opt.clipboard = 'unnamedplus'

--- Visual Settings
--- ======================================================================== ---
vim.opt.number = true               -- Show numbers
vim.opt.hlsearch = true             -- Higlights what we searched
vim.opt.wrap = false                -- Don't wrap long lines
vim.opt.listchars.extends=→         -- Show arrow if line continues rightwards
vim.opt.colorcolumn={100}           -- Show 100 col line
vim.opt.guicursor = ""              -- Block cursor
vim.optloaded_matchparen = 1        -- No matching parenthesis/brakets/... highlight
vim.opt.termguicolors = true        -- Colorschemes dont work well without this
vim.opt.background="dark"           -- Dark background, does nothing with gruvbox colorscheme

-- Splitting where i want
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set the colorscheme
local catppuccin = require("catppuccin")
catppuccin.setup({
    flavour = "frappe",
    integrations = {
        markdown = false,
    }
})

vim.api.nvim_command "colorscheme catppuccin-frappe"
