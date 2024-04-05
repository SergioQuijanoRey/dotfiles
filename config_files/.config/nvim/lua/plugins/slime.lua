-- Sends selected lines to another tmux / zellij pane
return {
    'jpalardy/vim-slime',
    config = function ()

        local setmap = require("myconf/aux").setmap
        local setmap_group_name = require("myconf/aux").setmap_group_name
        local nvim_exec = require("myconf/aux").exec

        -- Set zellij as the target
        vim.g.slime_target = "zellij"

        -- Slime saves a file, and the name of the file references `screen`, which we
        -- are not using, so give a name related to `zellij`
        HOME = os.getenv("HOME")
        vim.g.slime_paste_file = HOME .. "/.zellij_slime"

        -- Disable default mappings and set custom ones
        vim.g.slime_no_mappings = 1
        setmap_group_name("<leader>s", "Slime send comamnds")
        setmap("v", "<leader>s", ":SlimeSend<CR>", {}, "Send slime command")
        setmap("n", "<leader>s", ":SlimeSend<CR>", {}, "Send slime command")

        -- With zellij we cannot automatically choose some pane (its really buggy)
        -- But we can fill the prompt with the most probable config that we will want
        nvim_exec('let g:slime_default_config = {"session_id": "current", "relative_pane": "right"}')

    end
}
