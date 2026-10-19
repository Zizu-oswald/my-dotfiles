return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = false,
    },

    dashboard = {
      enabled = false,
    },

    picker = {
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "left",
              width = 30, -- ширина explorer
            },
          },
        },
      },
    },
  },
}
