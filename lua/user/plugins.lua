-- Bootstrap packer if needed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer... close and reopen Neovim.")
  vim.cmd([[packadd packer.nvim]])
end

-- Auto-reload on saving plugins.lua/init.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup END
]])

-- Use protected call to load packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = {
    enable = true,
    threshold = 1,
  },
})

-- Start plugin installation
packer.startup(function(use)
  -- Plugin Manager
  use "wbthomason/packer.nvim"

  -- Lua
  use "nvim-lua/plenary.nvim"

  -- UI
  use "nvim-tree/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  use "xiyaowong/nvim-transparent"
  use "petertriho/nvim-scrollbar"
  use "karb94/neoscroll.nvim"

  -- General Utils
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
      })
    end
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }

  -- Dev tools
  use "Civitasv/cmake-tools.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "navarasu/onedark.nvim"
  use "mhartington/oceanic-next"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "RRethy/vim-illuminate"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Autosave
  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
  }

  -- Copilot
  use "github/copilot.vim"

  -- Automatically sync after first install
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- LSP Setup (lua_ls replacement for sumneko)
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
