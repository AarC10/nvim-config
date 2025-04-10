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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
