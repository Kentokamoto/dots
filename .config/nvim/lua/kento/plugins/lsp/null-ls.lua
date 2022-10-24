local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
    return
end

null_ls.setup({
sources = {
        -- Python
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.diagnostics.flake8,
        -- Rust
        require("null-ls").builtins.formatting.rustfmt,
        -- C++
        require("null-ls").builtins.formatting.clang_format,
        require("null-ls").builtins.diagnostics.clang_check,
        -- Lua
        require("null-ls").builtins.formatting.stylua,

    },
})
