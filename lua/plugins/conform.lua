return {
    "stevearc/conform.nvim",
    version = "*",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" },
                cpp = { "clang-format" },
                markdown = { "prettier" },
                json = { "jmatte" },
            },
            formatters = {
                jmatte = {
                    command = "jmatte",
                    stdin = true,
                },
            },
        })

        vim.keymap.set('n', '<leader>cf', conform.format, { desc = "conform format" })
    end
}
