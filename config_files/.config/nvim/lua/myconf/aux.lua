--- Aux functions to use in other places of the config

-- Methods we are going to export
local M = {}

-- Libraries that we are going to use
local wk = require("which-key")


--- Executes a vim command
--- @param command string containing the nvim command
---
--- This function does not return the str output of the vim command
function M.exec(command)
    -- Second boolean parameter shows that we don't want the str output of
    -- executing the command
    vim.api.nvim_exec(command, false)
end

--- Function to set maps. This is handy because the api for this might change
--- (nvim is not quite stable yet), and thus we can have single change affect
--- all maps
---
--- NOTE: also useful because we are using third party libraries (whichkey) for
--- setting the keymaps, and this might change in the future
---
--- Example: `setmap("n", "<Tab>", ":echo hello", {noremap = True}, 'Just print hello world')`
function M.setmap(mode, keymap, command, opts, description)

    -- Sanitize input
    description = description or ""

    if opts == nil then
	print('opts was nil, so giving default value')
    	opts = {}
    end

    -- WhichKey puts the mode inside the opts table
    local myopts = opts
    myopts.mode = mode

    -- Construct the whichkey mapping
    local mapping = {
        [keymap] = {command, description}
    }

    wk.register({mapping, myopts})
end

--- Define a group name for a set of mappings using whichkey
function M.setmap_group_name(keymap, groupname)
    wk.register({
        [keymap] = {name = groupname}
    })
end


-- Run a command and capture the output of the command
function M.runcommand(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

-- Splits a string, the results are returned in a table
function M.strsplit(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

-- Get the length of a table
function M.tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

return M
