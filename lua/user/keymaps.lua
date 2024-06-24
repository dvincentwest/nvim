local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
-- local keymap = vim.api.nvim_set_keymap

-- remap space as the leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard keeps the same text after pasting
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>pf", "<cmd> Telescope find_files<CR>", opts)

-- autoformat
vim.api.nvim_set_keymap("n", "<leader>fmt", '<cmd>lua require("conform").format({lsp_fallback = true})<CR>', opts)

