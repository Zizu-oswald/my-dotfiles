return {
  "nvim-lualine/lualine.nvim",

  opts = {
    options = {
      theme = {
        normal = {
          a = { fg = "#c0c0c0", bg = "#000080", gui = "bold" },
          b = { fg = "#ffffff", bg = "#696969" },
          c = { fg = "#c0c0c0", bg = "#131313" },
        },

        insert = {
          a = { fg = "#c0c0c0", bg = "#007000", gui = "bold" },
        },

        visual = {
          a = { fg = "#c0c0c0", bg = "#4B0082", gui = "bold" },
        },

        replace = {
          a = { fg = "#c0c0c0", bg = "#800000", gui = "bold" },
        },

        inactive = {
          a = { fg = "#c0c0c0", bg = "#808080", gui = "bold" },
          b = { fg = "#808080", bg = "#131313" },
          c = { fg = "#c0c0c0", bg = "#131313" },
        },
      },
    },
  },
}
