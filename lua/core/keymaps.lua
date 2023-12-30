local util = require('plugins.util.mapping')
local map_cr = util.map_cr
local map_cu = util.map_cu
local map_cmd = util.map_cmd
local map_callback = util.map_callback

local default_map = {
  -- Base
	["n|W"] = map_cu("write"):with_noremap():with_silent():with_desc("base: Write file"),
	["n|Q"] = map_cu("quit"):with_noremap():with_silent():with_desc("base: Quit file"),
	["n|Y"] = map_cmd("y$"):with_desc("base: Yank text to EOL"),
	["n|D"] = map_cmd("d$"):with_desc("base: Delete text to EOL"),
	["n|j"] = map_cmd("gj"):with_noremap():with_silent():with_desc("base: Display lines downward"),
	["n|k"] = map_cmd("gk"):with_noremap():with_silent():with_desc("base: Display lines upward"),
	["n|H"] = map_cr("0"):with_desc("base: Move text to header"),
	["n|L"] = map_cr("$"):with_desc("base: Move text to EOL"),
	["n|J"] = map_cr("10j"):with_desc("base: Fast move to down"),
	["n|K"] = map_cr("10k"):with_desc("base: Fast move to up"),
	["i|<C-w>"] = map_cmd("<Esc>:w<CR>"):with_desc("base: Save file"),
	["i|<C-s>"] = map_cr("<Esc>:wq<CR>"):with_desc("base: Save&quit"),
	["i|<C-q>"] = map_cr("<Esc>q!<CR>"):with_desc("base: Save&quit"),
	["n|<C-q>"] = map_cr("<Esc>q!<CR>"):with_desc("base: Save&quit"),
	["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap():with_desc("edit: Delete previous block"),
	["i|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap():with_desc("edit: Move cursor to line start"),
  -- Window
	["n|sh"] = map_cr("set nosplitright<CR>:vsplit"):with_noremap():with_desc("window: split vertical to right"),
	["n|sl"] = map_cr("set splitright<CR>:vsplit"):with_noremap():with_desc("window: split vertical to left"),
	["n|sj"] = map_cr("set splitbelow<CR>:split"):with_noremap():with_desc("window: split horizontal to down"),
	["n|sk"] = map_cr("set nosplitbelow<CR>:split"):with_noremap():with_desc("window: split horizontal to up"),
	["n|smv"] = map_cr("<C-w>t<C-W>H"):with_noremap():with_desc("window: split horizontal to up"),
	["n|<leader>w"] = map_cmd("<C-w>w"):with_noremap():with_desc("window: Move cursor to window below/right of the current one"),
	["n|<leader>h"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
	["n|<leader>l"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
	["n|<leader>j"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
	["n|<leader>k"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),
	["n|<leader>q"] = map_cmd("<C-w>q"):with_noremap():with_desc("window: quit split"),
  ["n|<Up>"] = map_cmd("res +5"):with_noremap():with_desc("window: Resize window"),
  ["n|<Down>"] = map_cmd("res -5"):with_noremap():with_desc("window: Resize window"),
	["n|<A-[>"] = map_cr("vertical resize -5"):with_silent():with_desc("window: Resize -5 vertically"),
	["n|<A-]>"] = map_cr("vertical resize +5"):with_silent():with_desc("window: Resize +5 vertically"),
	["n|<A-;>"] = map_cr("resize -2"):with_silent():with_desc("window: Resize -2 horizontally"),
	["n|<A-'>"] = map_cr("resize +2"):with_silent():with_desc("window: Resize +2 horizontally"),
	-- Command mode
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Left"),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Right"),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap():with_desc("edit: Home"),
	["c|<C-e>"] = map_cmd("<End>"):with_noremap():with_desc("edit: End"),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
	["c|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
		:with_noremap()
		:with_desc("edit: Complete path of current file"),
	-- Visual mode
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("edit: Move this line down"),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("edit: Move this line up"),
	["v|<"] = map_cmd("<gv"):with_desc("edit: Decrease indent"),
	["v|>"] = map_cmd(">gv"):with_desc("edit: Increase indent"),
}

util.nvim_load_mapping(default_map)
