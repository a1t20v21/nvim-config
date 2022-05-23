-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
--packer.init({
--	display = {
--		open_fn = function()
--			return require("packer.util").float({ border = "rounded" })
--		end,
--	},
--})

-- Install plugins
return packer.startup(function(use)
  -- plugins start here:
  use 'wbthomason/packer.nvim' -- packer can manage itself
  -- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  	-- Syntax helpers
	use("nvim-treesitter/nvim-treesitter")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Tag viewer
  use 'preservim/tagbar'

  -- Colorschemes
  use 'navarasu/onedark.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use 'rktjmp/lush.nvim'
	use("lunarvim/darkplus.nvim")
	use("sainnhe/sonokai")
	use("kyazdani42/nvim-web-devicons")
	use({ "ellisonleao/gruvbox.nvim" })

  -- Terraform
  use 'hashivim/vim-terraform'

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- Git
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
    requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("gitsigns").setup({})
		end,
	})

  -- Tabs Mgmt
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- LSP
  --use {
  --  "williamboman/nvim-lsp-installer",
  --  {
  --      "neovim/nvim-lspconfig",
  --      config = function()
  --        require("nvim-lsp-installer").setup({
  --          automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  --          ui = {
  --              icons = {
  --                server_installed = "✓",
  --                server_pending = "➜",
  --                server_uninstalled = "✗"
  --              }
  --            }
  --          })
  --          -- local lspconfig = require("lspconfig")
  --          -- lspconfig.sumneko_lua.setup {}
  --      end
  --  }
  --}
  use 'neovim/nvim-lspconfig'
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- formatters and linters

  	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "kevinhwang91/nvim-hlslens" })

	-- Better escaping
	use({
		"max397574/better-escape.nvim",
		event = { "InsertEnter" },
		config = function()
			require("better_escape").setup({
				mapping = { "ii", "jj", "jk", "kj" },
				timeout = vim.o.timeoutlen,
				keys = "<ESC>",
			})
		end,
	})
	-- Better Scroll
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			})
		end,
	})

	-- Boost startup time
	use({
		"nathom/filetype.nvim",
		config = function()
			vim.g.did_load_filetypes = 1
		end,
	})

	-- Cursorhold fix
	use({
		"antoinemadec/FixCursorHold.nvim",
		event = "BufRead",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	})

	-- Optimiser
	use({
		"lewis6991/impatient.nvim",
	})

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
    },
  }

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
