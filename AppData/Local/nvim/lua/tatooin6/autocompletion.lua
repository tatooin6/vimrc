local completion_lsp = require('completion')
lua require('lspconfig').tsserver.setup{
        on_attach = completion_lsp.on_attach
}
