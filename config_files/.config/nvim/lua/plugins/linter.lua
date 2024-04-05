return {
    -- Linter plugin
    -- Useful when the language server does not have linting
    -- Or when a separate linter is more useful (i.e. python with ruff)
    'mfussenegger/nvim-lint',
    config = function()
        local lint = require("lint")
        -- Configure linters by filetype
        -- See available linters in https://github.com/mfussenegger/nvim-lint#available-linters
        lint.linters_by_ft = {
            -- Both ruff and mypy can be added to pylsp enviroment
            -- But that is really hard to do in NixOS
            -- Also, configured that way, they consume a lot of resources
            python = {
                "ruff",
                "mypy"
            },

            sql = {
                "sqlfluff",
            }
        }

        -- Run the linter when saving the file
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end
}
