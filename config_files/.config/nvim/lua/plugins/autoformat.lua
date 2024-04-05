return {
    -- Autoformater
    -- With the lsp we can do manual formats, but sometimes we want to
    -- autoformat our code
    -- Also, sometimes we want autoformating without lsp (i.e. isort in python)
    'stevearc/conform.nvim',
    opts = {
        -- Select the formater for each filetype
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "isort" },
            sql = { "sql-formatter" }
        },

        -- To utilize our user-defined functions to enable/disable autoformating
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_fallback = true }
        end,
    },
    config = function(opts)
        require("conform").setup(opts)

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
    end
}
