return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night", -- night | storm | moon | day
    transparent = true, -- Включает базовую прозрачность
    styles = {
      sidebars = "transparent", -- Делает прозрачными Neo-tree, Snacks Explorer и др.
      floats = "transparent", -- Делает прозрачными плавающие окна (Which-key, Mason, Noice)
      keywords = { italic = false },
      comments = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
  },
}
