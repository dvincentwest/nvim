-- some basic options
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
-- vim.opt.autochdir = true

vim.opt.relativenumber = true

-- for nicer terminals
vim.opt.termguicolors = true

-- foldoptions
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
