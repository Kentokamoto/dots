local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.embedded_template = {
  filetype = "ejs",
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
}
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.ejs = "embedded_template"

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
}
