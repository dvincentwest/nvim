require("config.lazy")
require("options")

-- TODO:
-- setup cmake/ninja compile commands
--   - preferably this would be a project local setup

-- Consider putting the following into a Vince's plugin or something
vim.keymap.set("n", "<leader>bd", ":bn<bar>bd #<CR>", { desc = "close a buffer but preserve window layout" })
