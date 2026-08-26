return {
  -- Отключаем линтер
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },

  -- Отключаем форматтер
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = {},
      },
    },
  },
  -- Настройка Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        highlight_inline = "RenderMarkdownCodeInline",
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", {
        bg = "#252525",
      })
    end,
  },
}
