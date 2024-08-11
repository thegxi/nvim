local bind = require("keymap.bind")

local plug_map = {
	-- Plugin: neo-tree.nvim
	["n|<leader>e"] = bind.map_cr("Neotree"):with_noremap():with_silent():with_desc("file-tree: Open tree"),
}

bind.nvim_load_mapping(plug_map)

