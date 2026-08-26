return {
  {
    "nvim-mini/mini.surround",
    opts = {
      custom_surroundings = {},

      -- Длительность подсветки (в мс) при вызове MiniSurround.highlight()
      highlight_duration = 500,

      -- Настройка клавиш
      mappings = {
        add = "gsa", -- Добавить обертку в Normal и Visual режимах
        delete = "gsd", -- Удалить обертку
        find = "gsf", -- Найти обертку справа
        find_left = "gsF", -- Найти обертку слева
        highlight = "gsh", -- Подсветить обертку
        replace = "gsr", -- Заменить обертку
        suffix_last = "l", -- Суффикс для поиска "предыдущего"
        suffix_next = "n", -- Суффикс для поиска "следующего"
      },

      -- Количество строк для поиска скобок вверх/вниз
      n_lines = 20,

      -- Учитывать тип выделения (построчно / блочно)
      respect_selection_type = false,

      -- Отключение информационных сообщений
      silent = false,
    },
  },
}
