local exec = require("myconf/aux").exec
local setmap = require("myconf/aux").setmap

-- Enable and disable automatic formatting on save
vim.api.nvim_create_user_command(
    "FormatDisable",
    function(args)
        if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
        else
            vim.g.disable_autoformat = true
        end
    end,
    {
        desc = "Disable autoformat-on-save",
        bang = true,
    }
)
vim.api.nvim_create_user_command(
    "FormatEnable",
    function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
    end,
    {
        desc = "Re-enable autoformat-on-save",
    }
)


--- Goes to the cwd of the file we are editing
local cd_file_path = function()
    -- Move to dir of current file
    exec(":cd %:p:h", false)

    -- Print that new path
    local new_cwd = exec(":pwd", true)
    return new_cwd
end
setmap("n", "<leader>cd", cd_file_path, {}, "Change nvim dir to cwd")
