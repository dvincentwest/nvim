return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                -- Conform will run multiple formatters sequentially
                lua = { "stylua" },
                python = { "ruff_format" },
                cpp = { "clang-format" },
                markdown = { "prettier" },
            },
        })

        vim.keymap.set('n', '<leader>cf', conform.format, { desc = "conform format" })
    end
}
