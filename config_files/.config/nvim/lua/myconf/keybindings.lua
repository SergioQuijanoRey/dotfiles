--- General Keybindings
--- Not all keybindings are defined here
--- For example, "myconf/debugging" has keybindings defined there

--- Avoid long lines for the set command
setmap = require("myconf/aux").setmap

--- General Remaps
--- ======================================================================== ---

-- Fast movement
setmap("n", "<C-Down>", "3j", {})
setmap("n", "<C-Up>", "3k", {})
setmap("n", "<C-j>", "3j", {})
setmap("n", "<C-k>", "3k", {})

-- Whole block identation
setmap("v", "<", "<gv", {noremap = true})
setmap("v", ">", ">gv", {noremap = true})

-- Spell checking
setmap("n", "<F5>", ":setlocal spell! spelllang=es<CR>", {})
setmap("n", "<F6>", ":setlocal spell! spelllang=en<CR>", {})

-- Open a terminal in a split
setmap("n", "<leader>k", ":sp<CR>:terminal<CR>A", {})
setmap("n", "<leader>K", ":vsp<CR>:terminal<CR>A", {})

-- Focus mode for writting
setmap("n", "<leader>f", ":Goyo 120x120<CR>:set wrap<CR>:set linebreak<CR>:set breakindent<CR>:lua require('lualine').hide()<CR>", {})
setmap("n", "<leader><S-f>", ":Goyo<CR>:set nowrap<CR>:set number<CR>:lua require('lualine').hide({unhide = true})<CR>:Catppuccin frappe<CR>", {})

-- Open Nerd tree
setmap("n", "<leader>o", ":NvimTreeToggle<CR>", {})

-- For exiting the terminal mode
setmap("t", "<leader><Esc>", "<C-\\><C-n>>", {noremap = true})

-- For avoid shifting
setmap("n", "<S-Up>", "<C-Up>", {})
setmap("n", "<S-Down>", "<C-Down>", {})

-- Tab Navigation
setmap("n", "<leader>t", ":tabnew<CR>", {})
setmap("n", "<leader>T", ":tabnew<CR>:terminal<CR>A", {})
setmap("n", "<leader>1", "1gt", {})
setmap("n", "<leader>2", "2gt", {})
setmap("n", "<leader>3", "3gt", {})
setmap("n", "<leader>4", "4gt", {})
setmap("n", "<leader>5", "5gt", {})
setmap("n", "<leader>6", "6gt", {})
setmap("n", "<leader>7", "7gt", {})
setmap("n", "<leader>8", "8gt", {})
setmap("n", "<leader>9", "9gt", {})

-- Undo break points
-- When writting a line, instead of undoing the whole line, just undo to the latest savepoint
setmap("i", ",", ",<c-g>u", {noremap=true})
setmap("i", ".", ".<c-g>u", {noremap=true})
setmap("i", "!", "!<c-g>u", {noremap=true})
setmap("i", "?", "?<c-g>u", {noremap=true})
setmap("i", ":", ":<c-g>u", {noremap=true})
setmap("i", "[", "[<c-g>u", {noremap=true})
setmap("i", "]", "]<c-g>u", {noremap=true})
setmap("i", "(", "(<c-g>u", {noremap=true})
setmap("i", ")", ")<c-g>u", {noremap=true})
setmap("i", "{", "{<c-g>u", {noremap=true})
setmap("i", "}", "}<c-g>u", {noremap=true})

-- Git integration
setmap("n", "<leader>g", ":Git<CR>", {})
setmap("n", "<leader>G", ":vertical Git<CR>", {})

-- Change NVIM Working Directory
-- Usefull when using fzf to open a file and instantly change NVIM working dir
setmap("n", "<leader>cd", ":lua require('myconf/custom_funcs').cd_file_path()<CR>", {})

-- Source the configuration
setmap("n", "<F4>", ":source ~/.config/nvim/init.lua<cr>", {noremap=true})

-- Maps for easy align
setmap("n", "<leader>a", "<Plug>(EasyAlign)", {})
setmap("x", "<leader>a", "<Plug>(EasyAlign)", {})

-- keymap for enabling or disabling gitsigns
-- Sometimes It can clutter the UI
setmap('n', '<leader>uig', ":Gitsign toggle_signs<CR>", {})
--- Telescope remaps
--- ======================================================================== ---
setmap("n", "<leader>p", "<cmd>Telescope find_files<cr>", {noremap=true})
setmap("n", "<leader>ll", "<cmd>Telescope<CR>", {noremap=true})
setmap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", {noremap=true})
setmap("n", "<leader>lb", "<cmd>Telescope buffers<cr>", {noremap=true})
setmap("n", "<leader>lf", "<cmd>Telescope filetypes<cr>", {noremap=true})
setmap("n", "<leader>l/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {noremap=true})
setmap("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>", {noremap=true})
