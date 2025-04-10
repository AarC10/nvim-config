return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- enabled format on save
    opts = require "configs.conform",
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Base
        "vim", "lua", "vimdoc",
        -- Requested languages
        "c", "cpp", "go", "python", "java", "rust",
        -- Embedded
        "devicetree", "cmake", "make", "llvm", "asm",
      },
      highlight = {
        enable = true,
      },
    },
  },

  -- Mason for easy LSP/formatter installation
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = {"Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog"},
    opts = {
      ensure_installed = {
        -- LSP
        "clangd", -- C/C++
        "gopls", -- Go
        "pyright", -- Python
        "jdtls", -- Java
        "rust_analyzer", -- Rust
        -- Formatters
        "clang-format",
        "gofumpt",
        "black",
        "rustfmt",
      },
    },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
      },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      shade_terminals = true,
    },
  },

  -- Autosave
  {
    "pocco81/auto-save.nvim",
    event = "InsertLeave",
    opts = {
      execution_message = {
        message = function()
          return ""
        end,
      },
      trigger_events = {"InsertLeave", "TextChanged"},
    },
  },

  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },

  -- Language specific plugins
  
  -- Rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
  },
  
  -- Go
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
    },
    ft = {"go", "gomod"},
    opts = {},
  },
}
