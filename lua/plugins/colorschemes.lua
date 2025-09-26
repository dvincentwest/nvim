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
        name = "no-clown-fiesta",
        priority = 1000,
        config = function()
            require("no-clown-fiesta").setup({
                transparent = true, -- Enable this to disable the bg color
                styles = {
                    -- You can set any of the style values specified for `:h nvim_set_hl`
                    comments = {},
                    functions = {},
                    keywords = {},
                    lsp = {},
                    match_paren = {},
                    type = {},
                    variables = {},
                },
            })
            vim.cmd.colorscheme("no-clown-fiesta")

            local bg_light = "#373B43"
            local bg_dark = "#24272C"
            local bg_cursor = bg_light

            -- Make colorcolumn and statusline transparent after colorscheme loads
            vim.api.nvim_set_hl(0, "ColorColumn", { bg = bg_light })
            vim.api.nvim_set_hl(0, "StatusLine",  { bg = "NONE" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#666666", bg = "NONE" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#999999", bg = bg_cursor })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "Visual", { bg = bg_dark })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = bg_cursor })
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
    -- {  -- a perhaps misguided attempt at my own colorscheme
    --     dir = "/Users/vince/Coding/nvim/vincefont/vnord.nvim",
    --     config = function()
    --         require("vnord").setup()
    --         vim.cmd.colorscheme("vnord")
    --     end,
    -- }

}
