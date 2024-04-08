--- General Keybindings
--- Not all keybindings are defined here
--- For example, "myconf/debugging" has keybindings defined there

--- Avoid long lines for the set command
local setmap = require("myconf/aux").setmap
local setmap_group_name = require("myconf/aux").setmap_group_name

--- General Remaps
--- ======================================================================== ---

-- Fast movement
setmap("n", "<C-Down>", "3j", {}, "Go three down")
setmap("n", "<C-Up>", "3k", {}, "Go three up")
setmap("n", "<C-j>", "3j", {}, "Go three down")
setmap("n", "<C-k>", "3k", {}, "Go three up")

-- Whole block identation
setmap("v", "<", "<gv", { noremap = true }, "Ident block left")
setmap("v", ">", ">gv", { noremap = true }, "Ident block right")

-- Spell checking
setmap("n", "<F5>", ":setlocal spell! spelllang=es<CR>", {}, "Spanish spell check")
setmap("n", "<F6>", ":setlocal spell! spelllang=en<CR>", {}, "English spell check")

-- Open a terminal in a split
setmap("n", "<leader>k", ":sp<CR>:terminal<CR>A", {}, "Open horizontal terminal")
setmap("n", "<leader>K", ":vsp<CR>:terminal<CR>A", {}, "Open vertical terminal")


-- For exiting the terminal mode
setmap("t", "<leader><Esc>", "<C-\\><C-n>>", { noremap = true }, "Needed for exiting terminal mode")

-- For avoid shifting
setmap("n", "<S-Up>", "<C-Up>", {})
setmap("n", "<S-Down>", "<C-Down>", {})

-- Tab Navigation
setmap_group_name("<leader>t", "Tab management")
setmap("n", "<leader>tt", ":tabnew<CR>", {}, "Create new tab")
setmap("n", "<leader>tT", ":tabnew<CR>:terminal<CR>A", {}, "Create new tab an open a terminal")
setmap("n", "<leader>t1", "1gt", {}, "Go to tab 1")
setmap("n", "<leader>t2", "2gt", {}, "Go to tab 2")
setmap("n", "<leader>t3", "3gt", {}, "Go to tab 3")
setmap("n", "<leader>t4", "4gt", {}, "Go to tab 4")
setmap("n", "<leader>t5", "5gt", {}, "Go to tab 5")
setmap("n", "<leader>t6", "6gt", {}, "Go to tab 6")
setmap("n", "<leader>t7", "7gt", {}, "Go to tab 7")
setmap("n", "<leader>t8", "8gt", {}, "Go to tab 8")
setmap("n", "<leader>t9", "9gt", {}, "Go to tab 9")

-- Undo break points
-- When writting a line, instead of undoing the whole line, just undo to the latest savepoint
-- NOTE -- for some reason, they need the normal vim API, they fail when using our API
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true })
vim.keymap.set("i", ":", ":<c-g>u", { noremap = true })
vim.keymap.set("i", "[", "[<c-g>u", { noremap = true })
vim.keymap.set("i", "]", "]<c-g>u", { noremap = true })
vim.keymap.set("i", "(", "(<c-g>u", { noremap = true })
vim.keymap.set("i", ")", ")<c-g>u", { noremap = true })
vim.keymap.set("i", "{", "{<c-g>u", { noremap = true })
vim.keymap.set("i", "}", "}<c-g>u", { noremap = true })

-- Source the configuration
setmap("n", "<F4>", ":source ~/.config/nvim/init.lua<cr>", { noremap = true }, "Source the configuration")

-- Maps for easy align
setmap_group_name("<leader>a", "Easy align")
setmap("n", "<leader>a", "<Plug>(EasyAlign)", {})
setmap("v", "<leader>a", "<Plug>(EasyAlign)", {})

-- Maps for some macro utilities
setmap_group_name("<leader>m", "Macro utilities")
setmap("v", "<leader>mm", ":norm @q<CR>", {}, "Apply @q macro in selection mode")

--- Telescope remaps
--- ======================================================================== ---
setmap_group_name("<leader>l", "Telescope")
setmap("n", "<leader>p", "<cmd>Telescope find_files<cr>", { noremap = true }, "Telescope find files")
setmap("n", "<leader>ll", "<cmd>Telescope<CR>", { noremap = true }, "All telescope options")
setmap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { noremap = true }, "Live grep")
setmap("n", "<leader>lb", "<cmd>Telescope buffers<cr>", { noremap = true }, "Buffers")
setmap("n", "<leader>lf", "<cmd>Telescope filetypes<cr>", { noremap = true }, "Filetypes")
setmap("n", "<leader>l/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true }, "Current buffer fuzzy find")
setmap("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>", { noremap = true }, "Diagnostics")
