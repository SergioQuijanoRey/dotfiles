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


ls.add_snippets("rmd", {

    -- Easily require a function
    s("cell", fmt(
        "```{{r}}\n{}\n```",
        {i(1, "<code>")}
    )),

    -- Header of the .Rmd file
    s("mdtitle", fmt(
[[---
title: {}
author:
    - Sergio Quijano Rey
    - sergioquijano@correo.ugr.es
date: {}
output:
    html_document:
        toc: true
        toc_depth: 3
        toc_float: true
        collapsed: true
        number_sections: true
---]],
        {i(1), i(2)}
    )),

}, {
    key = "rmd",
})


ls.add_snippets("tex", {

    -- Create a bullet list
    s("list", fmt(
[[
\begin{itemize}
    \item <>
    \item <>
    \item <>
\end{itemize}
]],
        {i(1), i(2), i(3)},
        {delimiters = "<>"}
    )),

    -- Create an enumerate list
    s("elist", fmt(
[[
\begin{enumerate}
    \item <>
    \item <>
    \item <>
\end{enumerate}
]],
        {i(1), i(2), i(3)},
        {delimiters = "<>"}
    )),

    -- Bold certain text
    s("bold", fmt("\\textbf{<>}",
        {i(1)},
        {delimiters = "<>"}
    )),

    -- Italic certain text
    s("it", fmt("\\textit{<>}",
        {i(1)},
        {delimiters = "<>"}
    )),


    -- Make a cite
    s("cite", fmt("\\cite{<>}",
        {i(1)},
        {delimiters = "<>"}
    )),




}, {
    key = "tex",
})
