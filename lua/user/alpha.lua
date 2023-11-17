local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
-- dashboard.section.header.val = {
-- 	[[                               __                ]],
-- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

dashboard.section.header.val = {
    [[                                                                               ]], 
    [[___  ___      _______       ___           ___           ________               ]],
    [[|\  \|\  \    |\  ___ \     |\  \         |\  \         |\   __  \             ]],
    [[\ \  \\\  \   \ \   __/|    \ \  \        \ \  \        \ \  \|\  \            ]],
    [[ \ \   __  \   \ \  \_|/__   \ \  \        \ \  \        \ \  \\\  \     ___   ]],
    [[  \ \  \ \  \   \ \  \_|\ \   \ \  \____    \ \  \____    \ \  \\\  \   |\  \  ]],
    [[   \ \__\ \__\   \ \_______\   \ \_______\   \ \_______\   \ \_______\  \ \  \ ]],
    [[    \|__|\|__|    \|_______|    \|_______|    \|_______|    \|_______|  _\/  /|]],
    [[                                                                       |\___/ /]],
    [[                                                                       \|___|/ ]],
    [[                                                                               ]],
    [[ ________      ________      ________      ________      ________              ]],
    [[|\   __  \    |\   __  \    |\   __  \    |\   __  \    |\   ___  \            ]],
    [[| \  \|\  \   \ \  \|\  \   \ \  \|\  \   \ \  \|\  \   \ \  \\ \  \           ]],
    [[ \ \   __  \   \ \   __  \   \ \   _  _\   \ \  \\\  \   \ \  \\ \  \          ]],
    [[  \ \  \ \  \   \ \  \ \  \   \ \  \\  \|   \ \  \\\  \   \ \  \\ \  \         ]],
    [[   \ \__\ \__\   \ \__\ \__\   \ \__\\ _\    \ \_______\   \ \__\\ \__\        ]],
    [[    \|__|\|__|    \|__|\|__|    \|__|\|__|    \|_______|    \|__| \|__|        ]],
    [[                                                                               ]],
    [[                                                                               ]],
    [[                                                                               ]],
}



dashboard.section.buttons.val = {
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}


local function fortune()
	local handle = io.popen("fortune")
	local fortune = handle:read("*a")
	handle:close()
	return fortune
end

local function footer()
  return "Welcome Aaron!"
end

dashboard.section.footer.val = fortune()
  
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
