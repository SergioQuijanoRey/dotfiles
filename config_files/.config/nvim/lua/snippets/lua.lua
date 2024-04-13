-- First configure some luasnip behavior
local ls = require("luasnip")
local types = require "luasnip.util.types"

-- Shorthands for defining snippets
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- The filetype where we want to inject the snippets
local FILETYPE = "lua"

-- Make adding new snippets easier, instead of having a gigantic table
local add_snippet = function(snippets, snippet_name, snippet_format)
    local new_snippet = s(
        snippet_name,
        snippet_format
    )
    return table.insert(snippets, new_snippet)
end

local snippets = {}

-- Require files easily
add_snippet(snippets, "require", fmt(
    "local {} = require(\"{}\")",
    { i(1, "plug_name"), rep(1) },
    {}
))

-- Finally, inform lua snip that we want to set this snippets
ls.add_snippets(FILETYPE, snippets, {
    key = FILETYPE,
})
