local setmap = require("myconf/aux").setmap
local setmap_group_name = require("myconf/aux").setmap_group_name

return {
    { 'lambdalisue/suda.vim', config = true, lazy = true }, -- For sudo writting a file
    {                                                       -- Undoo tree
        'mbbill/undotree',
        config = function()
            local setmap = require("myconf/aux").setmap
            setmap('n', '<F4>', vim.cmd.UndotreeToggle, {}, "Toggle undo tree")
        end
    },
    { -- Smooth scrolling
        'karb94/neoscroll.nvim',
        opts = {
            -- All these keys will be mapped to their corresponding default scolling animation
            mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,       -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        }
    },
    { -- Autopairs certain chars as " or [
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },

    -- Commenting code
    {
        'preservim/nerdcommenter',
        config = function()
            local exec = require("myconf/aux").exec

            -- Add spaces after comment delimiters by default
            exec([[let g:NERDSpaceDelims = 1]])

            -- Use the default mappings
            exec([[let g:NERDCreateDefaultMappings = 1]])
        end
    },
    -- Align plugin
    {
        'junegunn/vim-easy-align',
        config = function()
            setmap_group_name("<leader>a", "Easy align")
            setmap("n", "<leader>a", "<Plug>(EasyAlign)", {})
            setmap("v", "<leader>a", "<Plug>(EasyAlign)", {})
        end
    },
}
