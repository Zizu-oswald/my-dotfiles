return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    -- 1. Настройка командной строки (Cmdline)
    cmdline = {
      enabled = true,
      view = "cmdline", -- "cmdline_popup" (по центру) или "cmdline" (классическая внизу)
    },

    -- Routes для вывода :! в сплите
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "shell_cmd",
        },
        opts = {
          skip = true,
        },
      },

      {
        filter = {
          event = "msg_show",
          kind = {
            "shell_out",
            "shell_err",
          },
        },
        view = "split",
        opts = {
          enter = true,
        },
      },
    },

    -- 3. Пакет пресетов для быстрой настройки
    presets = {
      long_message_to_split = true, -- Длинные сообщения автоматические уводить в обычный split-буфер
    },
  },
}
