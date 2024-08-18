local bind = require("keymap.bind")

local base_map = {
  -- Normal 
  ["n|<C-s>"] = bind.map_cu("write"):with_noremap():with_silent():with_desc("edit: Save file"),
  ["n|Y"] = bind.map_cmd("y$"):with_desc("edit: Yank text to EOL"),
	["n|D"] = bind.map_cmd("d$"):with_desc("edit: Delete text to EOL"),
  ["n|<C-h>"] = bind.map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
	["n|<C-l>"] = bind.map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
	["n|<C-j>"] = bind.map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
	["n|<C-k>"] = bind.map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),
  ["n|<A-h>"] = bind.map_cr("vertical resize -3"):with_silent():with_desc("window: Resize -3 vertically"),
	["n|<A-l>"] = bind.map_cr("vertical resize +3"):with_silent():with_desc("window: Resize +3 vertically"),
	["n|<A-j>"] = bind.map_cr("resize -3"):with_silent():with_desc("window: Resize -3 horizontally"),
	["n|<A-k>"] = bind.map_cr("resize +3"):with_silent():with_desc("window: Resize +3 horizontally"),
	["n|<C-q>"] = bind.map_cr("wq"):with_desc("edit: Save file and quit"),
	["n|<A-S-q>"] = bind.map_cr("q!"):with_desc("edit: Force quit"),
  ["n|tn"] = bind.map_cr("tabnew"):with_noremap():with_silent():with_desc("tab: Create a new tab"),
	["n|tk"] = bind.map_cr("tabnext"):with_noremap():with_silent():with_desc("tab: Move to next tab"),
	["n|tj"] = bind.map_cr("tabprevious"):with_noremap():with_silent():with_desc("tab: Move to previous tab"),
	["n|to"] = bind.map_cr("tabonly"):with_noremap():with_silent():with_desc("tab: Only keep current tab"),

  -- Insert
  ["i|<C-u>"] = bind.map_cmd("<C-G>u<C-U>"):with_noremap():with_desc("edit: Delete previous block"),
	["i|<C-b>"] = bind.map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-a>"] = bind.map_cmd("<ESC>^i"):with_noremap():with_desc("edit: Move cursor to line start"),
	["i|<C-s>"] = bind.map_cmd("<Esc>:w<CR>"):with_desc("edit: Save file"),
	["i|<C-q>"] = bind.map_cmd("<Esc>:wq<CR>"):with_desc("edit: Save file and quit"),

  -- Command
  ["c|<C-b>"] = bind.map_cmd("<Left>"):with_noremap():with_desc("edit: Left"),
	["c|<C-f>"] = bind.map_cmd("<Right>"):with_noremap():with_desc("edit: Right"),
	["c|<C-a>"] = bind.map_cmd("<Home>"):with_noremap():with_desc("edit: Home"),
	["c|<C-e>"] = bind.map_cmd("<End>"):with_noremap():with_desc("edit: End"),
	["c|<C-d>"] = bind.map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
	["c|<C-h>"] = bind.map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
	["c|<C-t>"] = bind.map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
		:with_noremap()
		:with_desc("edit: Complete path of current file"),
  -- Visual
  ["v|J"] = bind.map_cmd(":m '>+1<CR>gv=gv"):with_desc("edit: Move this line down"),
	["v|K"] = bind.map_cmd(":m '<-2<CR>gv=gv"):with_desc("edit: Move this line up"),
	["v|<"] = bind.map_cmd("<gv"):with_desc("edit: Decrease indent"),
	["v|>"] = bind.map_cmd(">gv"):with_desc("edit: Increase indent"),
}

bind.nvim_load_mapping(base_map)
