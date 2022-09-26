local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    ["rust-analyzer"] = {
      checkOnSave = {
          command = "clippy"
      },
    },
  },
})
--local nvim_lsp = require'lspconfig'
--
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--nvim_lsp.rust_analyzer.setup({
--    capabilities=capabilities,
--    settings = {
--        ["rust-analyzer"] = {
--            assist = {
--                importGranularity = "module",
--                importPrefix = "by_self",
--            },
--            cargo = {
--                loadOutDirsFromCheck = true
--            },
--            procMacro = {
--                enable = true
--            },
--            checkOnSave = {
--                command = "clippy"
--            },
--        }
--    }
--})
