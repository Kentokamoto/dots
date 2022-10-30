local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
    return
end

null_ls.setup({
    debug = true,
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
        -- HTML
        require("null-ls").builtins.formatting.prettier,

    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
