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
            vim.cmd.colorscheme("nightfox")
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
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme catppuccin-frappe")
        end
    },
    -- {  -- a perhaps misguided attempt at my own colorscheme
    --     dir = "/Users/vince/Coding/nvim/vincefont/vnord.nvim",
    --     config = function()
    --         require("vnord").setup()
    --         vim.cmd.colorscheme("vnord")
    --     end,
    -- }

}
