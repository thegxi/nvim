local bind = require("keymap.bind")

local plug_map = {
	-- Plugin: neo-tree.nvim
	["n|<leader>e"] = bind.map_cr("Neotree"):with_noremap():with_silent():with_desc("file-tree: Open tree"),
	-- grug-far
	["n|<leader>gw"] = bind.map_cr("lua require('grug-far').grug_far({ prefills = { search = vim.fn.expand('<cword>') } })"):with_noremap():with_silent():with_desc("search: current word under the cursor"),
	["n|<leader>ge"] = bind.map_cr("lua require('grug-far').grug_far({ engine = 'astgrep' })"):with_noremap():with_silent():with_desc("grug-far: use ast-grep engine"),
	["n|<leader>gb"] = bind.map_cr("lua require('grug-far').grug_far({ transient = true })"):with_noremap():with_silent():with_desc("grug-far: as a transient buffer which is both unlisted and fully deletes itself when not in use"),
	["n|<leader>gs"] = bind.map_cr("lua require('grug-far').grug_far({ prefills = { paths = vim.fn.expand('%') } })"):with_noremap():with_silent():with_desc("grug-far: limiting search/replace to current file"),
	["n|<leader>gf"] = bind.map_cu("lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })'%') } })"):with_noremap():with_silent():with_desc("grug-far: the current visual selection, searching only current file"),
	["n|<leader>gt"] = bind.map_cr("lua require('grug-far').toggle_instance({ instanceName='far', staticTitle='Find and Replace' })"):with_noremap():with_silent():with_desc("grug-far: Toggle visibility of a particular instance and set title to a fixed string"),
	-- falsh.nvim
	-- ["n|s"] = bind.map_callback(function() require("flash").jump() end):with_expr():with_desc("Flash"),
	-- ["x|s"] = bind.map_callback(function() require("flash").jump() end):with_expr():with_desc("Flash"),
	-- ["o|s"] = bind.map_callback(function() require("flash").jump() end):with_expr():with_desc("Flash"),
	-- ["n|S"] = bind.map_callback(function() require("flash").treesitter() end):with_expr():with_desc("Flash Tresitter"),
	-- ["x|S"] = bind.map_callback(function() require("flash").treesitter() end):with_expr():with_desc("Flash Tresitter"),
	-- ["o|S"] = bind.map_callback(function() require("flash").treesitter() end):with_expr():with_desc("Flash Tresitter"),
	-- ["o|r"] = bind.map_callback(function() require("flash").remote() end):with_expr():with_desc("Remote Flash"),
	-- ["x|R"] = bind.map_callback(function() require("flash").treesitter_search() end):with_expr():with_desc("Treesitter Search"),
	-- ["o|R"] = bind.map_callback(function() require("flash").remote() end):with_expr():with_desc("Remote Flash"),
	-- ["c|<c-s>"] = bind.map_callback(function() require("flash").toggle() end):with_expr():with_desc("Toggle Flash Search"),
}

bind.nvim_load_mapping(plug_map)

