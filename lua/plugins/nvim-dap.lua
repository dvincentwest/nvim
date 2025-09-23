-- We'll configure all of our DAP plugins in this file
return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- set temporary arrow mappings for DAP
            local function set_dap_keymaps(bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "<Down>", dap.step_over, opts)
                vim.keymap.set("n", "<Right>", dap.step_into, opts)
                vim.keymap.set("n", "<Left>", dap.step_out, opts)
                vim.keymap.set("n", "<Up>", dap.restart_frame, opts) -- depends on adapter
                vim.api.nvim_set_keymap("n", "<leader>dT",
                        "<cmd>lua require'dap'.disconnect({ terminateDebuggee = true })<CR><cmd>lua require'dap'.close()<CR>",
                        {})
            end

            local function clear_dap_keymaps(bufnr)
                pcall(vim.keymap.del, "n", "<Down>", { buffer = bufnr })
                pcall(vim.keymap.del, "n", "<Right>", { buffer = bufnr })
                pcall(vim.keymap.del, "n", "<Left>", { buffer = bufnr })
                pcall(vim.keymap.del, "n", "<Up>", { buffer = bufnr })
            end

            -- hook into dap events
            dap.listeners.after.event_initialized["dap_arrow_keys"] = function(session)
                local bufnr = vim.api.nvim_get_current_buf()
                set_dap_keymaps(bufnr)
            end

            dap.listeners.after.event_terminated["dap_arrow_keys"] = function(session)
                local bufnr = vim.api.nvim_get_current_buf()
                clear_dap_keymaps(bufnr)
            end

            dap.listeners.after.event_exited["dap_arrow_keys"] = function(session)
                local bufnr = vim.api.nvim_get_current_buf()
                clear_dap_keymaps(bufnr)
            end

            vim.keymap.set("n", "<leader>dr", dap.restart)
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "nvim-dap" },
        config = function()
            require("dap-python").setup("python3")
        end,
    },
    {
        "igorlfs/nvim-dap-view"
    },

}
