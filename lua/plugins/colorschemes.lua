return {
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false,    -- load at startup
        priority = 1000, -- make sure it loads before other start plugins
        config = function()
            -- vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        lazy = false,    -- load at startup
        priority = 1000, -- make sure it loads before other start plugins
        config = function()
            -- vim.cmd.colorscheme("terafox")
            -- vim.cmd.colorscheme("nightfox")
        end,
    },
    {
        "shaunsingh/nord.nvim",
        name = "nord",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("nord")
        end,
    },
    {
        "aktersnurra/no-clown-fiesta.nvim",
        priority = 1000,
        config = function()
            local plugin = require "no-clown-fiesta"
            plugin.setup({
                transparent = true,
                -- theme = "dark",
                theme = "dim",
                -- theme = "light",
                styles = {
                    type = { bold = true },
                    lsp = { underline = false },
                    match_paren = { underline = true },
                },
            })
            return plugin.load()
        end,
        lazy = false,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme catppuccin-frappe")
        end
    },
}
