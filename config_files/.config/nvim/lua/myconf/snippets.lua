-- Module where I define some snippets using luasnip

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

-- Shorthands for defining snippets
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

ls.add_snippets("all", {
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    s("expand", fmt(
        "-- Sergio says: {}\n-- Category is {}\n--Then {} says {}",
        {i(1, "default comment"), i(2, "category"), rep(1), rep(2)}
    )),
}, {
    key = "all",
})


ls.add_snippets("lua", {

    -- Easily require a function
    s("require", fmt(
        "local {} = require(\"{}\")",
        {i(1, "plug_name"), rep(1)}
    )),
}, {
    key = "lua",
})


ls.add_snippets("markdown", {

    -- Easily require a function
    s("mdtitle", fmt(
        "---\ntitle: {}\nauthor: {}\ndate: {}\ngeometry: margin = 3.0cm\n---",
        {i(1, "titulo"), i(2, "Sergio Quijano Rey"), i(3, "fecha")}
    )),
}, {
    key = "markdown",
})
