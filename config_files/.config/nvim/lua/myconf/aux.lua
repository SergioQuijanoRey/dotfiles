--- Aux functions to use in other places of the config

-- Methods we are going to export
local export_table = {}

--- Executes a vim command
--- @param command a string containing the nvim command
---
--- This function does not return the str output of the vim command
function export_table.exec(command)
    -- Second boolean parameter shows that we don't want the str output of
    -- executing the command
    vim.api.nvim_exec(command, false)
end

--- Function to set maps. This is handy because the api for this might change
--- (nvim is not quite stable yet), and thus we can have single change affect
--- all maps
--- Example: setmap("n", "<Tab>", ":echo hello", {})
function export_table.setmap(...)
    return vim.keymap.set(...)
end

return export_table
