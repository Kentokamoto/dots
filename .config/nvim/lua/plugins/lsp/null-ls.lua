return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- Javascript
          nls.builtins.formatting.prettierd,
          -- Lua
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          -- Python
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.black,
          -- Rust
          nls.builtins.formatting.rustfmt,
          -- CPP
          nls.builtins.diagnostics.clang_check,
          nls.builtins.formatting.clang_format,
        },
      }
    end,
  },
}
