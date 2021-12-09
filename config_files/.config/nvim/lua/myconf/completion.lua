-- Configure compe plugin
-- Bultin LSP has no autocompletion so it delegates to nvim-cmp

vim.o.completeopt = "menu,menuone,noselect" -- Enable compe completion

-- Setup nvim-cmp.
local cmp = require'cmp'

-- Min word length to trigger autcompletion
-- I use same min for all completion contexts
local min_keyword_length = 3

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- When doing ENTER, cmp talks with builtin lsp and let it do things like autoimport a module
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    -- Sources for autocmpletion
    -- Order matters, because it gives the priority for autocompletion
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = min_keyword_length },
        { name = 'buffer' , keyword_length = min_keyword_length, option = { keyword_pattern = [[\k\+]]} },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }),

    -- Set the formatting for the menu
    formatting = {
        with_text = True,
        menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            path = "[path]",
        },
    },
})

-- This way we can autocomplete searches in vim
-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer', keyword_length = min_keyword_length }

    }
})

-- This way we can autocomplete nvim commands starting with :
-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path', keyword_length = min_keyword_length }
    }, {
        { name = 'cmdline', keyword_length = min_keyword_length }
    })
})

-- Capabilites for lps are set in lsp configuration
-- This way is easier to pass nvim-cmp capabilites
