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
local FILETYPE = "markdown"

-- NOTE: Copied from the author docs
-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
    local fmt = fmt or "%Y-%m-%d"
    return sn(nil, i(1, os.date(fmt)))
end

--
local add_snippet = function(snippets, snippet_name, snippet_format)
    local new_snippet = {
        s(
            snippet_name,
            snippet_format
        )
    }


    table.insert(snippets, new_snippet)
end


local md_snippets = {}

add_snippet(
    md_snippets,
    "obsidianheader",
    fmt(
        [[
---
title: {}
type: {}
tags: {}
created_at: {}
last_modified: {}
---
]],
        {
            i(1, ""),
            i(2, "note"), i(3, ""),
            d(4, date_input, {}, { user_args = { "%d/%m/%Y" } }),
            d(5, date_input, {}, { user_args = { "%d/%m/%Y" } }),
        }
    )
)

add_snippet(
    md_snippets,
    "weekorg",
    fmt(
        [[
# Lunes

- Mañana
    - [ ]
- Tarde
    - [ ]

# Martes

- Mañana
    - [ ]
- Tarde
    - [ ]

# Miércoles

- Mañana
    - [ ]
- Tarde
    - [ ]

# Jueves

- Mañana
    - [ ]
- Tarde
    - [ ]

# Viernes

- Mañana
    - [ ]
- Tarde
    - [ ]

# Sábado

- Mañana
    - [ ]
- Tarde
    - [ ]

# Domingo

- Mañana
    - [ ]
- Tarde
    - [ ]
]],
        {}
    ))

add_snippet(
    md_snippets,
    "code",
    fmt(
        [[
```{}
{}
```
]],
        { i(1, "python"), i(2, "") }
    )
)


-- Finally, inform lua snip that we want to set this snippets
ls.add_snippets(FILETYPE, md_snippets, {
    key = FILETYPE,
})
