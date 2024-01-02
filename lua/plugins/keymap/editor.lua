local util = require('plugins.util.mapping')
local map_cr = util.map_cr
local map_cu = util.map_cu
local map_cmd = util.map_cmd
local map_callback = util.map_callback

local plugin_map = {
  --[[ =============================
       ========suda.nvim============
       =============================--]]
	["n|<C-S-s>"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editor: Save file using sudo"),
  --[[ =============================
       ========bufferline.nvim======
       =============================--]]
	["n|<A-,>"] = map_cu("BufferLineCyclePrev"):with_silent():with_noremap():with_desc("editor: previous buffer"),
	["n|<A-.>"] = map_cu("BufferLineCycleNext"):with_silent():with_noremap():with_desc("editor: next buffer"),
	["n|<A-c>o"] = map_cu("BufferLineCloseOthers"):with_silent():with_noremap():with_desc("editor: close other buffer except current buffer"),
	["n|<A-c>l"] = map_cu("BufferLineCloseLeft"):with_silent():with_noremap():with_desc("editor: close left buffer"),
	["n|<A-c>r"] = map_cu("BufferLineCloseRight"):with_silent():with_noremap():with_desc("editor: close left buffer"),
	["n|<A-g>"] = map_cu("BufferLineGropuToggle"):with_silent():with_noremap():with_desc("editor: group buffer"),
	["n|<A-c>g"] = map_cu("BufferLineGropuClose"):with_silent():with_noremap():with_desc("editor: close group buffer"),
	["n|<A-p>"] = map_cu("BufferLinePick"):with_silent():with_noremap():with_desc("editor: pick buffer"),
	["n|<A-c>p"] = map_cu("BufferLinePickClose"):with_silent():with_noremap():with_desc("editor: close pick buffer"),
}

util.nvim_load_mapping(plugin_map)
