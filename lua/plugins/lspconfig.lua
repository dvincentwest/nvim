-- Example LSP keymap setup
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  -- LSP navigation
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)

  -- Hover / signature help
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Workspace
  -- TODO: inspect what this is useful for
  -- keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  -- keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  -- keymap("n", "<leader>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts)

  -- Refactor
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Diagnostics  -- I think these might already be set
  -- keymap("n", "gl", vim.diagnostic.open_float, opts)
  -- keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  -- keymap("n", "]d", vim.diagnostic.goto_next, opts)
  -- keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

  -- Formatting
  keymap("n", "<leader>cf", function()
    vim.lsp.buf.format { async = true }
  end, opts)
end




return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        -- C++
        lspconfig.clangd.setup({on_attach = on_attach})

        -- Lua
        lspconfig.lua_ls.setup({on_attach = on_attach})

        -- Python
        -- lspconfig.pyrefly.setup({}) -- not working for some reason
        lspconfig.pyright.setup({on_attach = on_attach})
        lspconfig.ruff.setup({})

    end
}
