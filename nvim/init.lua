pcall(require, "packer_compiled")

-- Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('plugins/nvim-lspconfig')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require("plugins/lualine")
require('plugins/alpha-nvim')
require('plugins/barbar')
require("plugins/null-ls")
-- lsp setup
require('lsp/rust')
require('lsp/yaml')
