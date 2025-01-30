return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      inlay_hints = { enabled = false },
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      servers = {
        jsonls = {},

        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeys[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        ruff_lsp = { -- Python LSP
          init_options = {
            settings = {
              -- Any extra CLI arguments for `ruff` go here.
              path = { "/opt/homebrew/bin/ruff" },
            },
          },
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                enable = false,
              },
            },
          },
        },
        tailwindcss = {
          filetypes_exclude = { "markdown" },
        },
        csharp_ls = {
          mason = false,
          settings = {
            path = { "/Users/kento_okamoto/.dotnet/tools/csharp-ls" },
          },
        },
        harper_ls = {
          settings = {
            ["harper_ls"] = {
              dianosticSeverity = "information",
              linters = {
                long_sentences = false,
                sentence_capitalization = true,
              },
            },
          },
        },
      },
      format_notify = false,
      autoformat = true,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
  },
}
