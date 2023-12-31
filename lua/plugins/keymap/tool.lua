local util = require('plugins.util.mapping')
local terminal = require('nvterm.terminal')
local ft_cmds = { python = 'python3 ' .. vim.fn.expand('%') }
local map_cr = util.map_cr
local map_cu = util.map_cu
local map_cmd = util.map_cmd
local map_callback = util.map_callback

local plugin_map = {
  --[[ =============================
       ========Plugin nvterm========
       =============================--]]
	--["n|<leader>tl"] = map_callback(function() terminal.send(ft_cmds[vim.bo.filetype]) end):with_noremap():with_silent():with_desc('terminal'),
	--["n|<leader>th"] = map_callback(function() terminal.toggle('horizontal') end):with_noremap():with_silent():with_desc('terminal: horizontal'),
	--["n|<leader>tv"] = map_callback(function() terminal.toggle('vertical') end):with_noremap():with_silent():with_desc('terminal: vertical'),
	--["n|<leader>tf"] = map_callback(function() terminal.toggle('float') end):with_noremap():with_silent():with_desc('terminal: float'),
	--["t|<leader>th"] = map_callback(function() terminal.toggle('horizontal') end):with_noremap():with_silent():with_desc('terminal: horizontal'),
	--["t|<leader>tv"] = map_callback(function() terminal.toggle('vertical') end):with_noremap():with_silent():with_desc('terminal: vertical'),
	--["t|<leader>tf"] = map_callback(function() terminal.toggle('float') end):with_noremap():with_silent():with_desc('terminal: float'),
  -- Plugin toggleterm 
  --["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["t|jk"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["n|<leader>th"] = map_cr("ToggleTerm direction=horizontal")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["t|<leader>th"] = map_cmd("<Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["n|<leader>tv"] = map_cr("ToggleTerm direction=vertical")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<leader>tv"] = map_cmd("<Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["n|<leader>tf"] = map_cr("ToggleTerm direction=float")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<leader>tf"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["n|<leader>tg"] = map_callback(function()
    local _lazygit = nil
    if vim.fn.executable("lazygit") == 1 then
      if not _lazygit then
        _lazygit = require("toggleterm.terminal").Terminal:new({
          cmd = "lazygit",
          direction = "float",
          close_on_exit = true,
          hidden = true,
        })
      end
      _lazygit:toggle()
    else
      vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
    end
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle lazygit"),
  --[[ =============================
       ========Plugin telescope=====
       =============================--]]
	["n|<leader>f"] = map_callback(function()
    require("telescope.builtin").keymaps({
      lhs_filter = function(lhs)
        return not string.find(lhs, "Þ")
      end,
      layout_config = {
        width = 0.6,
        height = 0.6,
        prompt_position = "top",
      },
    })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	["n|<leader>u"] = map_callback(function()
			require("telescope").extensions.undo.undo()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Show undo history"),
	["n|<leader>fr"] = map_callback(function()
			require("telescope").extensions.frecency.frecency({})
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: File by frecency"),
	["n|<leader>fw"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Word in project"),
	["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent():with_desc("find: File by history"),
	["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("find: File in project"),
	["n|<leader>fc"] = map_cu("Telescope colorscheme")
		:with_noremap()
		:with_silent()
		:with_desc("ui: Change colorscheme for current session"),
	["n|<leader>fn"] = map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),
	["n|<leader>fg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("find: file in git project"),
	["n|<leader>fz"] = map_cu("Telescope zoxide list")
		:with_noremap()
		:with_silent()
		:with_desc("edit: Change current direrctory by zoxide"),
	["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("find: Buffer opened"),
	["n|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("find: Current word"),
	["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent():with_desc("find: Session"),
  --[[ =============================
       ========Plugin nvim-tree=====
       =============================--]]
	["n|<leader>ne"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("tree: file manager"),
	["n|<leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent():with_desc("tree: find file"),
	["n|<leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent():with_desc("tree: refresh file")
}

util.nvim_load_mapping(plugin_map)
