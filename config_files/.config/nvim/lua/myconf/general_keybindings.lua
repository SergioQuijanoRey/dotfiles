--- General Keybindings that we do not define in a certain plugin configuration
local setmap = require("myconf/aux").setmap
local setmap_group_name = require("myconf/aux").setmap_group_name

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

-- For avoid shifting
setmap("n", "<S-Up>", "3k", {})
setmap("n", "<S-Down>", "3j", {})

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
setmap("n", "<leader>t<Left>", ":tabprevious<CR>", {}, "Go to previous tab")
setmap("n", "<leader>t<Right>", ":tabnext<CR>", {}, "Go to next tab")

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

-- Maps for some macro utilities
setmap_group_name("<leader>m", "Macro utilities")
setmap("v", "<leader>mm", ":norm @q<CR>", {}, "Apply @q macro in selection mode")
