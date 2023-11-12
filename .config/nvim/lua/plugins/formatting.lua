return {
  "stevearc/conform.nvim",
  enabled = true,
  log_level = vim.log.levels.DEBUG,
  opts = {
    formatters = {
      prettier = {
        prepend_args = function(ctx)
          if vim.bo.filetype == "javascript" then
            return { "--parser", "typescript" }
          end
          return {}
        end,
      },
    },
  },
}
