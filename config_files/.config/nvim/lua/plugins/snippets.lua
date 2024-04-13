return {
    'L3MON4D3/LuaSnip',

    dependencies = {
        -- For having autocompletion of the snippets trigger keywords
        'saadparwaiz1/cmp_luasnip'
    },
    config = function()
        -- First configure some luasnip behavior
        local ls = require("luasnip")
        local types = require "luasnip.util.types"

        ls.config.set_config {
            -- This tells LuaSnip to remember to keep around the last snippet.
            -- You can jump back into it even if you move outside of the selection
            history = true,

            -- This one is cool cause if you have dynamic snippets, it updates as you type!
            updateevents = "TextChanged,TextChangedI",

            -- Autosnippets:
            enable_autosnippets = true,

            -- Good highlights!!
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { " <- Current Choice", "NonTest" } },
                    },
                },
            },
        }

        -- Finally, require all the snippet files in the `snippets` folder
        require("snippets")
    end
}
