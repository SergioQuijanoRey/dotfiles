return {
    'L3MON4D3/LuaSnip',

    dependencies = {
        -- For having autocompletion of the snippets trigger keywords
        'saadparwaiz1/cmp_luasnip'
    },
    config = function()
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

        -- Returns a snippet_node wrapped around an insertNode whose initial
        -- text value is set to the current date in the desired format.
        local date_input = function(args, snip, old_state, fmt)
            local fmt = fmt or "%Y-%m-%d"
            return sn(nil, i(1, os.date(fmt)))
        end



        local conds = require("luasnip.extras.expand_conditions")

        ls.add_snippets("lua", {

            -- Easily require a function
            s("require", fmt(
                "local {} = require(\"{}\")",
                { i(1, "plug_name"), rep(1) }
            )),
        }, {
            key = "lua",
        })

        ls.add_snippets("rmd", {

            -- Easily require a function
            s("cell", fmt(
                "```{{r}}\n{}\n```",
                { i(1, "<code>") }
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
                { i(1), i(2) }
            )),

        }, {
            key = "rmd",
        })


        -- Finally, require all the snippet files in the `snippets` folder
        require("snippets")
    end
}
