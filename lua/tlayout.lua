-- A little module that creates my favorite tri-layout with a main split on the left
-- two splits on the right with a terminal in the lower right

local function Tlayout(opts)
  local wins = vim.api.nvim_tabpage_list_wins(0)

  -- If user explicitly requested rebuild
  if opts.args == "rebuild" then
    vim.cmd("only")
  elseif #wins == 3 then
    -- Check if we already have terminal buffer
    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == "terminal" then
        vim.api.nvim_set_current_win(win)
        return
      end
    end
    -- no terminal found, fallback to rebuild
    vim.cmd("only")
  else
    -- layout isn't right, fallback to rebuild
    vim.cmd("only")
  end

  -- Step 1: create vertical split
  vim.cmd("vsplit")

  -- Step 2: focus right split
  vim.cmd("wincmd l")

  -- Step 3: create horizontal split in right pane
  vim.cmd("split")

  -- Step 4: move to lower-right split
  vim.cmd("wincmd j")

  -- Step 5: open terminal
  vim.cmd("terminal")
end

vim.api.nvim_create_user_command("Tlayout", Tlayout, {
  nargs = "?",
  complete = function()
    return { "rebuild" }
  end,
})
