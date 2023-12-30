return function()
  -- https://nvimdev.github.io/
	require("lspsaga").setup({
		-- Breadcrumbs: https://dev.neovim.pro/lspsaga/breadcrumbs/
		symbol_in_winbar = {
			enable = true,
			separator = " › ",
			hide_keyword = false,
			show_file = false,
			folder_level = 1,
			color_mode = true,
			delay = 100,
		},
		-- https://dev.neovim.pro/lspsaga/callhierarchy/
		callhierarchy = {
			layout = "float",
			keys = {
				edit = "e",
				vsplit = "v",
				split = "s",
				tabe = "t",
				quit = "q",
				shuttle = "[]",
				toggle_or_req = "u",
				close = "<Esc>",
			},
		},
		-- https://dev.neovim.pro/lspsaga/codeaction/
		code_action = {
			num_shortcut = true,
			only_in_cursor = false,
			show_server_name = true,
			extend_gitsigns = false,
			keys = {
				quit = "q",
				exec = "<CR>",
			},
		},
    definition = {
        keys = {
          edit = '<C-c>o',
          vsplit = '<C-c>v',
          split = '<C-c>i',
          tabe = '<C-c>t',
          quit = 'q',
          close = '<C-c>k'
        }
    },
		-- https://dev.neovim.pro/lspsaga/diagnostic/
		diagnostic = {
			show_code_action = true,
			jump_num_shortcut = true,
			max_width = 0.5,
			max_height = 0.6,
			text_hl_follow = true,
			border_follow = true,
			extend_relatedInformation = true,
			show_layout = "float",
			show_normal_height = 10,
			max_show_width = 0.9,
			max_show_height = 0.6,
			diagnostic_only_current = false,
			keys = {
				exec_action = "r",
				quit = "q",
				toggle_or_jump = "<CR>",
				quit_in_show = { "q", "<Esc>" },
			},
		},
    finder = {
      max_height = 0.6,
      keys = {
        vsplit = 'v',
        shuttle = '[w', -- shuttle bettween the finder layout window,
        toggle_or_open = 'o', -- toggle expand or open,
        vsplit = 's', -- open in vsplit
        split = 'i', -- open in split
        tabe = 't', -- open in tabe,
        tabnew = 'r', -- open in new tab
        quit = 'q', -- quit the finder, only works in layout left window
        close = '<C-c>k', -- close finder
      }
    },
		-- https://dev.neovim.pro/lspsaga/hover/
		hover = {
			max_width = 0.45,
			max_height = 0.7,
			open_link = "gl",
			open_cmd = "!firefox", 
		},
		-- https://dev.neovim.pro/lspsaga/implement/
		implement = {
			enable = true,
			sign = true,
			virtual_text = false,
			priority = 100,
		},
		-- https://dev.neovim.pro/lspsaga/lightbulb/
		lightbulb = {
			enable = false,
			sign = true,
			virtual_text = false,
			debounce = 10,
			sign_priority = 20,
		},
		-- https://dev.neovim.pro/lspsaga/rename/
		rename = {
			in_select = false,
			auto_save = false,
			project_max_width = 0.5,
			project_max_height = 0.5,
			keys = {
				quit = "<C-c>",
				exec = "<CR>",
				select = "x",
			},
		},
		-- https://dev.neovim.pro/lspsaga/misc/#beacon
		beacon = {
			enable = true,
			frequency = 12,
		},
		-- https://dev.neovim.pro/lspsaga/misc/#generic-ui-options
		ui = {
			border = "single", -- Can be single, double, rounded, solid, shadow.
			devicon = true,
			title = true,
			expand = '⊞',
			collapse = '⊟',
			code_action = '💡',
			actionfix = ' ',
			lines = { "┗", "┣", "┃", "━", "┏" },
			imp_sign = '󰳛 ',
			kind = {
				-- Kind
				Class = { "󰠱", "LspKindClass" },
				Constant = { "󰏿", "LspKindConstant" },
				Constructor = { "", "LspKindConstructor" },
				Enum = { "", "LspKindEnum" },
				EnumMember = { "", "LspKindEnumMember" },
				Event = { "", "LspKindEvent" },
				Field = { "󰇽", "LspKindField" },
				File = { "󰈙", "LspKindFile" },
				Function = { "󰊕", "LspKindFunction" },
				Interface = { "", "LspKindInterface" },
				Key = { "󰌋", "LspKindKey" },
				Method = { "󰆧", "LspKindMethod" },
				Module = { "", "LspKindModule" },
				Namespace = { "󰌗", "LspKindNamespace" },
				Number = { "", "LspKindNumber" },
				Operator = { "󰆕", "LspKindOperator" },
				Package = { "", "LspKindPackage" },
				Property = { "󰜢", "LspKindProperty" },
				Struct = { "", "LspKindStruct" },
				TypeParameter = { "󰅲", "LspKindTypeParameter" },
				Variable = { "", "LspKindVariable" },
				-- Type
				Array = { "󰅪", "LspKindArray" },
				Boolean = { "", "LspKindBoolean" },
				Null = { "󰟢", "LspKindNull" },
				Object = { "󰅩", "LspKindObject" },
				String = { "󰉿", "LspKindString" },
				-- ccls-specific icons.
				TypeAlias = { "", "LspKindTypeAlias" },
				Parameter = { "󰅲", "LspKindParameter" },
				StaticMethod = { "", "LspKindStaticMethod" },
				-- Microsoft-specific icons.
				Text = { "󰉿", "LspKindText" },
				Snippet = { "", "LspKindSnippet" },
				Folder = { "󰉋", "LspKindFolder" },
				Unit = { "", "LspKindUnit" },
				Value = { "󰎠", "LspKindValue" },
			},
		},
		-- https://dev.neovim.pro/lspsaga/misc/#scrolling-keymaps
		scroll_preview = {
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
		request_timeout = 3000,
	})
end
