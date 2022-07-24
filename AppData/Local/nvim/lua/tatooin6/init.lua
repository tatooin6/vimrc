-- TreeSitter Configuration
-- Docs: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/treesitter.lua
require'nvim-treesitter.configs'.setup({
  ensure_installed = "all", -- one of "all" or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css", "markdown" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },
})
-- require'tree-sitter-typescript'.typescript -- TypeScript grammar
-- require'tree-sitter-typescript'.tsx -- TSX grammar
  
-- CPM Config
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- NVIM LSP SETUP
-- require'tatooin6.tslspconfig'
require'lspconfig'.tsserver.setup{ -- Connect to server
  capabilities = capabilities,
	on_attach = function() -- runs everytime a file is attached to the server
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})	
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})	
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})	
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})	
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {buffer=0})	
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})	
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})	
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})	
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) -- CTRL Q when opened to open the list under the editor 	
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer=0}) -- CTRL Q when opened to open the list under the editor 	

	end,
}

-- NVIM CMP SETUP
-- require'tatooin6.completion'
local cmp = require'cmp'

cmp.setup({
  -- Formatting the displayed completion
  formatting = {
    format = function(entry, vim_item)
      -- vim_item.kind = 'kind'
      -- vim_item.menu = 'menu'
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        look = "[Dict]",
        buffer = "[Buffer]",
        path = "[Path]",
        ultisnips = "[Snip]",
        gh_issues = "[Issues]"
      })[entry.source.name]
      return vim_item
    end
  },  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})
