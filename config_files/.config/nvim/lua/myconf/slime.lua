-- Config for the slime plugin

local setmap = require("myconf/aux").setmap
local nvim_exec = require("myconf/aux").exec

-- Set tmux as the target
vim.g.slime_target = "tmux"

-- The file used for it has a screen name
-- So set a tmux name for more clarity
vim.g.slime_paste_file = "$HOME/.tmux_slime"

-- Disable default mappings and set custom ones
vim.g.slime_no_mappings = 1
setmap("v", "<leader>s", ":SlimeSend<CR>", {})
setmap("n", "<leader>s", ":SlimeSend<CR>", {})

-- I use always one split for nvim and other split for REPL
-- So don't ask always for the same, set here:

-- First: dont ask
vim.g.slime_dont_ask_default = 1

-- Second: set default
nvim_exec('let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}')
