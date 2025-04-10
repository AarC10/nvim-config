local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    
    -- C/C++
    c = { "clang_format" },
    cpp = { "clang_format" },
    
    -- Go
    go = { "gofumpt" },
    
    -- Python
    python = { "black" },
    
    -- Rust
    rust = { "rustfmt" },
    
    -- Web
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
