require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- File explorer toggle
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle file explorer" })

-- Terminal options
map("n", "<leader>tf", "<cmd> ToggleTerm direction=float <CR>", { desc = "Terminal (float)" })
map("n", "<leader>th", "<cmd> ToggleTerm direction=horizontal <CR>", { desc = "Terminal (horizontal)" })
map("n", "<leader>tv", "<cmd> ToggleTerm direction=vertical <CR>", { desc = "Terminal (vertical)" })

-- Exit Neovim
map("n", "<leader>q", "<cmd> q <CR>", { desc = "Exit Neovim" })

-- Tab navigation with Ctrl+Tab / Ctrl+Shift+Tab
map("n", "<C-Tab>", "<cmd> tabnext <CR>", { desc = "Next tab" })
map("n", "<C-S-Tab>", "<cmd> tabprevious <CR>", { desc = "Previous tab" })
map("i", "<C-Tab>", "<cmd> tabnext <CR>", { desc = "Next tab" })
map("i", "<C-S-Tab>", "<cmd> tabprevious <CR>", { desc = "Previous tab" })

-- LSP
map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format() <CR>", { desc = "Format code" })
map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>", { desc = "Rename symbol" })
map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>", { desc = "Code action" })
map("n", "<leader>ld", "<cmd> lua vim.lsp.buf.definition() <CR>", { desc = "Go to definition" })
map("n", "<leader>li", "<cmd> lua vim.lsp.buf.implementation() <CR>", { desc = "Go to implementation" })
map("n", "<leader>lh", "<cmd> lua vim.lsp.buf.hover() <CR>", { desc = "Hover documentation" })
map("n", "<leader>lt", "<cmd> lua vim.lsp.buf.type_definition() <CR>", { desc = "Type definition" })
map("n", "<leader>le", "<cmd> lua vim.diagnostic.open_float() <CR>", { desc = "Show diagnostics" })

-- Debug
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Start/Continue debug" })
map("n", "<leader>do", "<cmd> DapStepOver <CR>", { desc = "Step over" })
map("n", "<leader>di", "<cmd> DapStepInto <CR>", { desc = "Step into" })
map("n", "<leader>du", "<cmd> DapUIToggle <CR>", { desc = "Toggle DAP UI" })
map("n", "<leader>dt", "<cmd> DapTerminate <CR>", { desc = "Terminate debug" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
