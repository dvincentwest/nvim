local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- remap space as the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard keeps the same text after pasting
keymap("v", "p", '"_dP', opts)

-- Telescope
keymap("n", "<leader>tree", "<cmd> Telescope treesitter<CR>", opts)
keymap("n", "<leader>file", "<cmd> Telescope find_files<CR>", opts)
keymap("n", "<leader>pf", "<cmd> Telescope git_files<CR>", opts)
keymap("n", "<leader>pb", "<cmd> Telescope buffers<CR>", opts)
keymap("n", "<leader>pg", "<cmd> Telescope live_grep<CR>", opts)
keymap("n", "<leader>pr", "<cmd> Telescope resume<CR>", opts)

-- Diagnostics  -- things like lsp errors
keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- autoformat
keymap("n", "<leader>fmt", '<cmd>lua require("conform").format({lsp_fallback = true})<CR>', opts)

