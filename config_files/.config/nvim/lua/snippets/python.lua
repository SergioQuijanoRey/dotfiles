-- First configure some luasnip behavior
local ls = require("luasnip")
local types = require "luasnip.util.types"

-- Shorthands for defining snippets
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- The filetype where we want to inject the snippets
local FILETYPE = "python"

-- NOTE: Copied from the author docs
-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
    local fmt = fmt or "%Y-%m-%d"
    return sn(nil, i(1, os.date(fmt)))
end

-- Make adding new snippets easier, instead of having a gigantic table
local add_snippet = function(snippets, snippet_name, snippet_format)
    local new_snippet = s(
        snippet_name,
        snippet_format
    )
    return table.insert(snippets, new_snippet)
end

local python_snippets = {}

-- Header that I use in all my obsidian notes
add_snippet(
    python_snippets,
    "header",
    fmt(
        [[
"""
@author: Sergio Quijano Rey
@created_at: {}
@last_modified: {}
@description: {}
"""
]],
        {
            d(1, date_input, {}, { user_args = { "%d/%m/%Y" } }),
            d(2, date_input, {}, { user_args = { "%d/%m/%Y" } }),
            i(3, "")
        },
        {}
    )
)

-- Way of setting up main function
add_snippet(
    python_snippets,
    "main",
    fmt(
        [[
def main():
    {}

if __name__ == "__main__":
    main()
]],
        {
            i(1, "pass")
        },
        {}
    )
)

-- Finally, inform lua snip that we want to set this snippets
ls.add_snippets(FILETYPE, python_snippets, {
    key = FILETYPE,
})
