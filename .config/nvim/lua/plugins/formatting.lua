return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
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
  },
}
