return {
  "dvincentwest/cmdrunner.nvim",  -- Replace with your GitHub username when published
  dev = true,              -- Set to false to use GitHub version
  config = function()
    require("cmdrunner").setup({
      -- Your configuration here
      keybinds = {
        run = "<F5>",
        build = "<F7>",
        configure = "<F19>",
        configure_alt = "<S-F7>",
      },
      -- Add any custom commands or settings
    })
  end,
}
