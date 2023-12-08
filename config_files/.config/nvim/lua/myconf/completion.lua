-- Configure completion plugin
-- Bultin LSP has no autocompletion so it delegates to nvim-cmp
--
-- Capabilites for lps are set in lsp configuration
-- This way is easier to pass nvim-cmp

local cmp = require 'cmp'
local lspkind = require('lspkind')

-- Integration with luasnip
local luasnip = require("luasnip")
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Min word length to trigger autcompletion
-- I use same min for all completion contexts
local min_keyword_length = 2

cmp.setup({
    -- This snipet configuration is required
    -- Some completion functionality relies on this
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    -- Configure visual appearence
    -- I prefer default appearence
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    -- Add icons to the completion source indicator (like VSCode)
    formatting = {
        format = lspkind.cmp_format(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- Luasnip keybindings
        -- Previous these two were <Tab> and <S-Tab>
        ["<C-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-S-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),


    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = min_keyword_length },
        { name = 'luasnip',  keyword_length = min_keyword_length },
        { name = 'emoji',    keyword_length = min_keyword_length },
    }, { {
        name = 'buffer',
        keyword_length = min_keyword_length,
        option = {
            keyword_pattern = [[\k\+]]
        }
    } }
    )
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        -- TODO -- previously was 'cmp_git'
        { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
