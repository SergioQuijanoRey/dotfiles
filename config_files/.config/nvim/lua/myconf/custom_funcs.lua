--- Custom lua functions, but related with editor functionality
--- That's to say, no aux functions

--- Aux functions to use for this custom functions
local exec = require("myconf/aux").exec

-- Local table to export the functions we are writing
local M = {}

--- Goes to the cwd of the file we are editing
function M.cd_file_path()
    -- Move to dir of current file
    exec(":cd %:p:h", false)

    -- Print that new path
    local new_cwd = exec(":pwd", true)
    return new_cwd
end

-- Return the exported functions
return M
