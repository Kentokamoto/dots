return {
  {
    "gitsigns.nvim",
    opts = function()
      Snacks.toggle({
        name = "Git Signs",
        get = function()
          return require("gitsigns.config").config.signcolumn
        end,
        set = function(state)
          require("gitsigns").toggle_signs(state)
        end,
      }):map("<leader>uG")
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "tpope/vim-rhubarb",
    dependencies = "tpope/vim-fugitive",
  },
}
