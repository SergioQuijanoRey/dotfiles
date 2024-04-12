-- This file will automatically require all the lua files in the snippets folder
-- This is a really easy way of setting up snippets per file type


local home = require("os").getenv("HOME") .. "/"
local dir = home .. ".config/nvim/lua/snippets"
local all_files = require("myconf.aux").scandir(dir)

for _, file in ipairs(all_files) do
    if file == "." or file == ".." or file == "init.lua" then
        goto continue
    end

    local basename = file:match("(.+)%..+") -- Remove the `.lua` file extension
    local module_path = "snippets/" .. basename

    require(module_path)

    ::continue::
end
