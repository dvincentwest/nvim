return {
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false, -- load at startup
        priority = 1000, -- make sure it loads before other start plugins
        config = function()
            vim.cmd.colorscheme("kanagawa")
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
}
