-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- Фильтруем двойное срабатывание клавиш
local last_press = {}
local function ignore_double(key)
  local now = vim.loop.hrtime()
  if last_press[key] and (now - last_press[key] < 1e7) then
    return true
  end
  last_press[key] = now
  return false
end

vim.keymap.set("i", "<BS>", function()
  if not ignore_double("<BS>") then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, false, true), "n", true)
  end
end)

vim.keymap.set("i", "<CR>", function()
  if not ignore_double("<CR>") then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", true)
  end
end)
--
-- toggle terminal mode <-> normal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal → Normal" })

vim.keymap.set("n", "<Esc>", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd("startinsert")
  else
    vim.cmd("noh")
  end
end, { desc = "Normal → Terminal (if terminal buffer)" })

-- vim.keymap.set("n", "<leader>n", function()
--   Snacks.notifier.show_history()
-- end, { desc = "Notification History" })

-- При нажатии <leader>n открывает подменю WhichKey для Noice
vim.keymap.set("n", "<leader>n", function()
  require("which-key").show({ keys = "<leader>sn" })
end, { desc = "Noice Menu" })
