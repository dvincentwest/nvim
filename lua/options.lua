-- the following yanks everything always to the clipboard
-- vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"
vim.opt.termguicolors = true

-- line/tab behaviors
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 88
vim.opt.colorcolumn = { 88, 100 }
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- disable tree sitter indenting and just use something local context aware
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.cindent = false
vim.cmd("filetype indent off")

-- vim.opt.formatoptions = "jcroql" -- defaults
-- The reason we have to create this autocmd is that these options are set on a filetype
-- basis and so whatever global default options are, they will get overridden
vim.api.nvim_create_autocmd(
    "BufEnter",
    {
        pattern = { "*.c", "*.cpp", "*lua", "*.py" },
        callback = function()
            -- these remove the behavior that comments are automatically continued on
            -- the next line when inserting a newline either from insert or normal modes
            vim.opt.formatoptions:remove({ "t", "o", "r", "c" })
            vim.bo.indentexpr = "nvim_treesitter#indent()"
        end,
    }
)


-- view all of the changes, such as from a search/replace command in a split at the
-- bottom. Helpful because it will show changes not currently visible also
vim.opt.inccommand = "split"

-- ignore type case when doing autocomplete for options and things
vim.opt.ignorecase = true

-- Use tree-sitter for folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99

-- vim.g.mapleader = " " -- setup by lazy.ngim

-- Setup Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})
local function V_ToggleDiagnostics()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end
vim.keymap.set("n", "<leader>bD", V_ToggleDiagnostics, { desc = "Toggle diagnostics on and off for the current buffer" })


-- Trim trailing whitespace and make exactly one newline
local function trim_whitespace_and_trailing_newlines()
    local save_cursor = vim.fn.getpos(".")
    -- Remove all trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
    -- Remove all trailing newlines
    vim.cmd([[%s/\n\+\%$//e]])
    -- VIM will automatically add a trailing newline when saving the file
end

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("trim_whitespace", { clear = true }),
    pattern = "*",
    callback = trim_whitespace_and_trailing_newlines,
})

-- some useful keymaps
vim.keymap.set("n", "<leader>bd", ":bn<bar>bd #<CR>", { desc = "close a buffer but preserve window layout" })
vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "force close neovim" })

-- autoload .nvim.lua files
vim.o.exrc = true

-- make the background whatever Ghostty's background is set to
-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")

-- enable syntax highlighting within the language blocks
vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "cpp", "c" }
