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

    -- Formatting - Disabled in favor of conform.nvim
    -- keymap("n", "<leader>cf", function()
    --     vim.lsp.buf.format { async = true }
    -- end, opts)
end


local function register_pyrefly()
    local configs = require("lspconfig.configs")
    if not configs.pyrefly then
        configs.pyrefly = {
            default_config = {
                cmd = { "pyrefly", "lsp" },
                filetypes = { "python" },
                root_dir = require("lspconfig.util").root_pattern(
                    'pyrefly.toml',
                    'pyproject.toml',
                    'setup.py',
                    'setup.cfg',
                    'requirements.txt',
                    'Pipfile',
                    '.git'
                ),
                single_file_support = true,
                on_exit = function(code, _, _)
                    vim.notify('Pyrefly LSP exited with code: ' .. code, vim.log.levels.INFO)
                end,
            },
        }
    end
end


return {
    "neovim/nvim-lspconfig",
    config = function()
        -- C++
        vim.lsp.config("clangd", { on_attach = on_attach })
        vim.lsp.enable("clangd")

        -- Lua
        vim.lsp.config("lua_ls", { on_attach = on_attach })
        vim.lsp.enable("lua_ls")

        -- Python

        -- PYREFLY, Testing instead of pyright, commented out below
        -- register_pyrefly() -- Add pyrefly as a custom server
        -- vim.lsp.config("pyrefly", { on_attach = on_attach })
        -- vim.lsp.enable("pyrefly")

        -- Disable while testing Pyrefly
        vim.lsp.config("pyright", {
            on_attach = on_attach,
            settings = {
                python = {
                    analysis = {
                        autoImportCompletions = false,
                        typeCheckingMode = "off",
                    },
                },
            },
        })
        vim.lsp.enable("pyright")

        vim.lsp.config("ruff", {})
        vim.lsp.enable("ruff")
    end
}
