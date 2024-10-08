return function()
	require("which-key").setup({
		preset = "classic",
		delay = vim.o.timeoutlen,
		triggers = {
			{ "<auto>", mode = "nixso" },
		},
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				motions = false,
				operators = false,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			border = "none",
			padding = { 1, 2 },
			wo = { winblend = 0 },
		},
		expand = 1,
		icons = {
			group = "",
			rules = false,
			colors = false,
			breadcrumb = "",
			separator = "│",
			keys = {
				C = "C-",
				M = "A-",
				S = "S-",
				BS = "<BS> ",
				CR = "<CR> ",
				NL = "<NL> ",
				Esc = "<Esc> ",
				Tab = "<Tab> ",
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				Space = "<Space> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
			},
		},
		spec = {
			{ "<leader>g", group = "󰊢" .. "Git" },
			{ "<leader>d", group = "" .. " Debug" },
			{ "<leader>s", group = "" .. "Session" },
			{ "<leader>b", group = "󰓩" .. " Buffer" },
			{ "<leader>S", group = "󰍉" .. " Search" },
			{ "<leader>W", group = "" .. " Window" },
			{ "<leader>p", group = "" .. " Package" },
			{ "<leader>l", group = "󱜙" .. " Lsp" },
			{ "<leader>f", group = "" .. " Fuzzy Find" },
			{ "<leader>n", group = "" .. " Nvim Tree" },
		},
	})
end
