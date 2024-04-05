return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        local exec = require("myconf.aux").exec

        -- In WSL firefox is working flawlessly
        exec("let g:mkdp_browser = 'firefox'")
    end
}
