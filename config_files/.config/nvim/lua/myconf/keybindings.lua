--- General Keybindings

--- Avoid long lines for the set command
setmap = vim.api.nvim_set_keymap

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
setmap("n", "<leader>f", ":Goyo 120x120<CR>:set wrap<CR>:set linebreak<CR>:set breakindent<CR>", {})
setmap("n", "<leader><S-f>", ":Goyo<CR>:set nowrap<CR>:set number<CR>", {})

-- Open Nerd tree
setmap("n", "<leader>o", ":NERDTreeToggle<CR>", {})

-- For exiting the terminal mode
-- TODO -- this remap is not working with lua functons
-- setmap("t", "<leader><Esc>", "<C-\><C-n>>", {noremap = true})
-- vim.api.nvim_exec("tnoremap <leader><Esc> <C-\><C-n>>", false)

-- For avoid shifting
setmap("n", "<S-Up>", "<C-Up>", {})
setmap("n", "<S-Down>", "<C-Down>", {})

-- Clears the search highlight
setmap("n", "<leader>m", ":noh<CR>", {})

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

-- Split navigation
-- TODO -- not using this, consider delete this
setmap("n", "<leader><Left>", ":wincmd h<CR>", {})
setmap("n", "<leader><Right>", ":wincmd l<CR>", {})
setmap("n", "<leader><Up>", ":wincmd k<CR>", {})
setmap("n", "<leader><down>", ":wincmd j<CR>", {})

-- Git integration
setmap("n", "<leader>g", ":Git<CR>", {})
setmap("n", "<leader>G", ":vertical Git<CR>", {})

-- Change NVIM Working Directory
-- Usefull when using fzf to open a file and instantly change NVIM working dir
setmap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", {})

-- Source the configuration
setmap("n", "<F4>", ":source ~/.config/nvim/init.lua<cr>", {noremap=true})

--- Telescope remaps
--- ======================================================================== ---
setmap("n", "<leader>p", "<cmd>Telescope find_files<cr>", {noremap=true})
setmap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", {noremap=true})
setmap("n", "<leader>lb", "<cmd>Telescope buffers<cr>", {noremap=true})
setmap("n", "<leader>lf", "<cmd>Telescope filetypes<cr>", {noremap=true})
setmap("n", "<leader>l/", "<cmd> Telescope current_buffer_fuzzy_find<cr>", {noremap=true})
