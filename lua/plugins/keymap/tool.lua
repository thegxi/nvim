local util = require('plugins.util.map')
local terminal = require('nvterm.terminal')
local ft_cmds = { python = 'python3 ' .. vim.fn.expand('%') }
local map_cr = util.map_cr
local map_cu = util.map_cu
local map_cmd = util.map_cmd
local map_callback = util.map_callback

local plugin_map = {
  -- Plugin nvterm
	["n|<leader>tl"] = map_callback(function() terminal.send(ft_cmds[vim.bo.filetype]) end):with_noremap():with_silent():with_desc('terminal'),
	["n|<leader>th"] = map_callback(function() terminal.toggle('horizontal') end):with_noremap():with_silent():with_desc('terminal: horizontal'),
	["n|<leader>tv"] = map_callback(function() terminal.toggle('vertical') end):with_noremap():with_silent():with_desc('terminal: vertical'),
	["n|<leader>tf"] = map_callback(function() terminal.toggle('float') end):with_noremap():with_silent():with_desc('terminal: float'),
	["t|<leader>th"] = map_callback(function() terminal.toggle('horizontal') end):with_noremap():with_silent():with_desc('terminal: horizontal'),
	["t|<leader>tv"] = map_callback(function() terminal.toggle('vertical') end):with_noremap():with_silent():with_desc('terminal: vertical'),
	["t|<leader>tf"] = map_callback(function() terminal.toggle('float') end):with_noremap():with_silent():with_desc('terminal: float')
}

util.nvim_load_mapping(plugin_map)
