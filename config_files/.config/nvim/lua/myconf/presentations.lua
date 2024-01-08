local setmap = require("myconf.aux").setmap
local exec = require("myconf.aux").exec

require("presenting").setup({
    options = {
        width = 120
    },
})

-- I want to enter presentation mode and execute some visual changes
local custom_presenting = function()
    -- Enter presenting mode
    exec(":Presenting")

    -- Visual changes
    require("myconf.zen").custom_zen(0.9)
    vim.opt.conceallevel = 2
end

setmap("n", "<leader>fp", function() custom_presenting() end, {}, "Toggle on and off presenting mode")
