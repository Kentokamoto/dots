local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
    return
end


local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then
    return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig["clangd"].setup({
    capabilities = capabilities,
})

lspconfig["pyright"].setup({
    capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
})
