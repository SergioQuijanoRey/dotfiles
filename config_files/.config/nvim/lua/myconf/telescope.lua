local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Construct the arguments to make live grep search also in hidden files
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) } -- Copy default arguments
table.insert(vimgrep_arguments, "--hidden")                                    -- Search in hidden files
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")                                  -- But don't search in .git folder

telescope.setup{
    defaults = {
        -- We are using the default sorter, that now works better than the rest
        file_sorter = require'telescope.sorters'.get_fuzzy_file,

        -- Live grep also searches in hidden files (dotfiles in Unix)
        vimgrep_arguments = vimgrep_arguments,
    },


    pickers = {
        -- Find files also in hidden files (dotfiles in Unix)
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
}
