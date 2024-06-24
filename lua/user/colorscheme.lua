-- A file that will let us load a color scheme with graceful handling if it
-- doesn't exit

-- local colorscheme = "default"
local colorscheme = "catppuccin-mocha"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

