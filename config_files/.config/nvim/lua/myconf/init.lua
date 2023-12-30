-- In this file we are going to import all the files
-- So in the root `init.lua` we can simpy do a `require("lua/myconf")`, instead
-- of manually loading all the plugins

-- Where I manage plugins. Therefore, it has to be required before the other files
require("myconf/plugin_manager")

-- The rest of the plugins don't require an specific order
-- So import them automatically

local home = require("os").getenv("HOME") .. "/"
local dir = home .. ".config/nvim/lua/myconf"
local all_files = require("myconf.aux").scandir(dir)

for _, file in ipairs(all_files) do
    if file == "." or file == ".." or file == "init.lua" or file == "plugin_manager.lua" then
        goto continue
    end

    local basename = file:match("(.+)%..+") -- Remove the `.lua` file extension
    local module_path = "myconf/" .. basename

    require(module_path)

    ::continue::
end
