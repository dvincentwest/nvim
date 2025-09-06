return {
    "pappasam/nvim-repl",
    config = function()
        vim.api.nvim_create_autocmd(
            "BufEnter",
            {
                pattern = "*.py",
                callback = function()
                    -- vim.keymap.set("n", "<leader>rt", "<cmd>ReplToggle<CR>",  { buffer = true })
                    vim.keymap.set("n", "<leader>rs", "<cmd>Repl<CR>",        { buffer = true })
                    vim.keymap.set("n", "<leader>rr", "<cmd>ReplRunCell<CR>", { buffer = true })
                end
            }
        )
    end
}
