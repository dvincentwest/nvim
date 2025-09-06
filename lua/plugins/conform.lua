return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "ruff" },
            },
        })

        vim.keymap.set('n', '<leader>cf', conform.format, { desc = "conform format" })
    end
}
