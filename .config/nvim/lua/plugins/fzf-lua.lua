return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      -- Ensure the file_ignore_patterns table exists
      opts.file_ignore_patterns = opts.file_ignore_patterns or {}
      -- Add your specific file to the ignore patterns
      table.insert(opts.file_ignore_patterns, "**/icons.scss")
    end,
  },
}
