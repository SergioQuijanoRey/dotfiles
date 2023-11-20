-- Configure linters by filetype
-- See available linters in https://github.com/mfussenegger/nvim-lint#available-linters
require('lint').linters_by_ft = {
    -- Both ruff and mypy can be added to pylsp enviroment
    -- But that is really hard to do in NixOS
    -- Also, configured that way, they consume a lot of resources
    python = {
        "ruff",
        "mypy"
    },
}

-- Run the linter when saving the file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
