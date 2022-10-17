-- Config for builtin lsp
-- Mostly copied from https://github.com/neovim/nvim-lspconfig#keybindings-and-completion

-- Load the plugin (lua imports modules this way)
local nvim_lsp = require('lspconfig')

-- Need to run this before configuring all of the servers
local lspinstaller = require("nvim-lsp-installer")
lspinstaller.setup {
    -- Detect wich servers to install based on which servers are configured via lspconfig
    automatic_installation = true,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Options for the mappings
    local opts = { noremap=true, silent=true }

    -- Keymappings
    buf_set_keymap('n', '<leader>qr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename
    buf_set_keymap('n', '<leader>qd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts) -- go to definition
    buf_set_keymap('n', '<leader>qa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- code actions
    buf_set_keymap('n', '<leader>ql', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>qs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', "<leader>qf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap('n', '<leader>qk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

    --buf_set_keymap("n", "<space>qd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Signature hint plugin
    cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        hint_prefix = "🐼 ",  -- Panda for parameter
        hint_scheme = "String",
        use_lspsaga = true,  -- set to true if you want to use lspsaga popup
        hi_parameter = "Search", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
            border = "shadow"   -- double, single, shadow, none
        },
        extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    }

    require'lsp_signature'.on_attach(cfg)
end

-- Also, get capabilities of nvim-cmp for autocompletions
-- We need to provide lsp info to nvim-cmp config to get lsp autocompletion!
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rounded borders for hover and signature help
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- We need to manually specify which servers we want to configure
-- Some languages are commented, because I am not using them now but might use them in the future
-- As we have set `automatic_installation = true`, this servers are installed automatically
local servers = {

    -- For C / C++
    "clangd",

    -- For dart
    -- "dartls",

    -- For Java
    -- "jdtls",

    -- For R
    "r_language_server",

    -- For Rust
    "rust_analyzer",

    -- For Ruby
    -- "sorbet",
    -- "solargraph",

    -- For lua
    "sumneko_lua",

    -- For python

    -- Main lsp component
    -- Enables a lot of plugins, like flake8, mypy, import sorting, rope, that have to be installed manually:
    --      https://github.com/williamboman/nvim-lsp-installer/blob/main/lua/nvim-lsp-installer/servers/pylsp/README.md
    -- Includes jedi, so no need to use that lsp when using pylsp
    "pylsp",
    "pyright", -- Static type checking
}

-- Iterate over all installed servers and apply the config to them
for _, server in ipairs(servers) do

    -- Setup given server
    require('lspconfig')[server].setup {
        on_attach = on_attach,

        -- Capabilities that were modified to talk with nvim-cmp
        capabilities = capabilities,

        -- Options to the lsp configuration
        settings = {
            -- For better performance
            flags = {
                debounce_text_changes = 150,
            },

        },
    }
end

