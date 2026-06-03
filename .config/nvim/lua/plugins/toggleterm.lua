-- return {
--   "akinsho/toggleterm.nvim",
--   opts = {
--     direction = "vertical", -- вместо horizontal
--     size = 80, -- ширина терминала
--   },
-- }
-- return {
--   "akinsho/toggleterm.nvim",
--   opts = function(_, opts)
--     opts.direction = "vertical"
--     opts.size = 80
--   end,
-- }
return {
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        terminal = {
          position = "right",
        },
      },
    },
  },
}
