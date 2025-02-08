return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "ruff",
        "harper-ls",
        "tailwindcss-language-server",
        "eslint_d",
        "prettierd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},
        lua_ls = {
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
        rust_analyzer = { -- Rust LSP
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                enable = false,
              },
            },
          },
        },
        tailwindcss = { -- TailwindCSS
          filetypes_exclude = { "markdown" },
        },
        harper_ls = { -- Grammar
          settings = {
            ["harper-ls"] = {
              dianosticSeverity = "information",
              markdown = {
                ignore_link_title = true,
              },
              linters = {
                an_a = true,
                long_sentences = false,
                sentence_capitalization = false,
                repeated_words = true,
                linking_verbs = true,
                avoid_curses = true,
              },
            },
          },
        },
      },
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
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = false,
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
