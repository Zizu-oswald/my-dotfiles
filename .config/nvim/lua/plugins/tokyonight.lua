return {

  "folke/tokyonight.nvim",
  opts = {
    style = "night", -- night | storm | moon | day
    transparent = false,
    styles = {
      sidebars = "dark",
      floats = "dark",
    },
    on_colors = function(colors)
      -- основной фон
      colors.bg = "#0b0f14"
      colors.bg_dark = "#090c10"
    end,
  },
}
