-- Config for the slime plugin

local setmap = require("myconf/aux").setmap
local nvim_exec = require("myconf/aux").exec

-- Set tmux as the target
vim.g.slime_target = "zellij"

-- Slime saves a file, and the name of the file references `screen`, which we
-- are not using, so give a name related to `zellij`
HOME = os.getenv("HOME")
vim.g.slime_paste_file = HOME .. "/.zellij_slime"

-- Disable default mappings and set custom ones
vim.g.slime_no_mappings = 1
setmap("v", "<leader>s", ":SlimeSend<CR>", {})
setmap("n", "<leader>s", ":SlimeSend<CR>", {})

-- With zellij we cannot automatically choose some pane (its really buggy)
-- But we can fill the prompt with the most probable config that we will want
nvim_exec('let g:slime_default_config = {"session_id": "current", "relative_pane": "right"}')
