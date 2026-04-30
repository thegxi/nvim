vim.pack.add({
	"https://github.com/altermo/ultimate-autopair.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	{ src = "https://github.com/folke/snacks.nvim", version = "v2.31.0" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})
require("plugins.colorscheme")
require("plugins.autopair")
require("plugins.mason")
require("plugins.blink")
require("plugins.snacks")
