-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Настройки табов
vim.opt.tabstop = 4 -- Количество пробелов в табе
vim.opt.shiftwidth = 4 -- Размер отступа для >> и <<
vim.opt.softtabstop = 4 -- Количество пробелов при редактировании
vim.opt.expandtab = true -- Преобразовать табы в пробелы

-- Высота командной строки (0 = полностью скрывать, когда не используется)
vim.opt.cmdheight = 0

vim.opt.number = true -- обычные номера строк
vim.opt.relativenumber = true -- выключить относительные

vim.opt.spell = false
--And I can always use the shortcut <leader>uh to toggle the inlay hint if when needed
