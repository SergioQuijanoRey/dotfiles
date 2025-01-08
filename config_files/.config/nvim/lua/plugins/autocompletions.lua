return {
    {
        "saghen/blink.cmp",
        dependencies = {
            -- We are going to autocomplete the snippets that LuaSnip manages
            "L3MON4D3/LuaSnip",
        },
        -- use a release tag to download pre-built binaries
        version = "v0.*",
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- see the "default configuration" section below for full documentation on how to define
            -- your own keymap.
            keymap = { preset = "enter" },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            snippets = {
                expand = function(snippet)
                    require("luasnip").lsp_expand(snippet)
                end,
                active = function(filter)
                    if filter and filter.direction then
                        return require("luasnip").jumpable(filter.direction)
                    end
                    return require("luasnip").in_snippet()
                end,
                jump = function(direction)
                    require("luasnip").jump(direction)
                end,
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer", "luasnip" },
                -- optionally disable cmdline completions
                -- cmdline = {},
                min_keyword_length = 3,
            },

            signature = { enabled = true },
        },
    },
}
