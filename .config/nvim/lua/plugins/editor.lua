return {
  {
    -- For showing diagnostics, references, telescope results,
    -- quickfix and location lists
    "folke/trouble.nvim",
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
  },
}
