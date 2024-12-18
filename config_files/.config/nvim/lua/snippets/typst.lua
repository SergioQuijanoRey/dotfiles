-- First configure some luasnip behavior
local ls = require("luasnip")
local types = require("luasnip.util.types")

-- Shorthands for defining snippets
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- The filetype where we want to inject the snippets
local FILETYPE = "typst"

-- Make adding new snippets easier, instead of having a gigantic table
local add_snippet = function(snippets, snippet_name, snippet_format)
	local new_snippet = s(snippet_name, snippet_format)
	return table.insert(snippets, new_snippet)
end

local snippets = {}

-- Easily create footnotes with marks
add_snippet(snippets, "footnotemark", fmt("#footnote([#last_footnote])", {}, { delimiters = "<>" }))

add_snippet(snippets, "footnotetext", fmt("#let last_footnote = [<>]", { i(1) }, { delimiters = "<>" }))

-- Finally, inform lua snip that we want to set this snippets
ls.add_snippets(FILETYPE, snippets, {
	key = FILETYPE,
})
