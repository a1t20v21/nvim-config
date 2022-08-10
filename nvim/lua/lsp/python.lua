local nvim_lsp = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.pyright.setup({
  capabilities=capabilities,
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
  settings = {
    pyright = { disableLanguageServices = false, disableOrganizeImports = true },
    python = {
      analysis = {
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
})
