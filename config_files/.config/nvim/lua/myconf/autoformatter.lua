--- Configure the autoformatter

-- Setup conform as our autoformat pluign
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "isort" },
    },
})


-- Autoformat on save, but we have `FormatEnable` and `FormatDisable` commands
-- This is useful in situations when the formater creates problems
require("conform").setup({
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return { timeout_ms = 500, lsp_fallback = true }
    end,
})

vim.api.nvim_create_user_command(
    "FormatDisable",
    function(args)
        if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
        else
            vim.g.disable_autoformat = true
        end
    end,
    {
        desc = "Disable autoformat-on-save",
        bang = true,
    }
)

vim.api.nvim_create_user_command(
    "FormatEnable",
    function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
    end,
    {
        desc = "Re-enable autoformat-on-save",
    }
)
