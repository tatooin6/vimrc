print('Hello autocompletion')
local completion_lsp = require('completion')
require('lspconfig').tsserver.setup{
        on_attach = completion_lsp.on_attach
}
