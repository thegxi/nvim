local util = require('plugins.util.map')
local map_cr = util.map_cr
local map_cu = util.map_cu
local map_cmd = util.map_cmd
local map_callback = util.map_callback

local plugin_map = {
  -- Plugin suda.vim
	["n|<C-S-s>"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editn: Save file using sudo"),
}

util.nvim_load_mapping(plugin_map)
