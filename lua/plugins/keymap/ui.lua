local util = require("plugins.util.mapping")

local mapping = {}

function mapping.gitsigns(buf)
	local actions = require("gitsigns.actions")
	local map = {
		["n|]g"] = util.map_callback(function()
			if vim.wo.diff then
				return "]g"
			end
			vim.schedule(function()
				actions.next_hunk()
			end)
			return "<Ignore>"
		end)
			:with_buffer(buf)
			:with_expr()
			:with_desc("git: Goto next hunk"),
		["n|[g"] = util.map_callback(function()
			if vim.wo.diff then
				return "[g"
			end
			vim.schedule(function()
				actions.prev_hunk()
			end)
			return "<Ignore>"
		end)
			:with_buffer(buf)
			:with_expr()
			:with_desc("git: Goto prev hunk"),
		["n|<leader>hs"] = util.map_callback(function()
			actions.stage_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Stage hunk"),
		["v|<leader>hs"] = util.map_callback(function()
			actions.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
			:with_buffer(buf)
			:with_desc("git: Stage hunk"),
		["n|<leader>hu"] = util.map_callback(function()
			actions.undo_stage_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Undo stage hunk"),
		["n|<leader>hr"] = util.map_callback(function()
			actions.reset_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Reset hunk"),
		["v|<leader>hr"] = util.map_callback(function()
			actions.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
			:with_buffer(buf)
			:with_desc("git: Reset hunk"),
		["n|<leader>hR"] = util.map_callback(function()
			actions.reset_buffer()
		end)
			:with_buffer(buf)
			:with_desc("git: Reset buffer"),
		["n|<leader>hp"] = util.map_callback(function()
			actions.preview_hunk()
		end)
			:with_buffer(buf)
			:with_desc("git: Preview hunk"),
		["n|<leader>hb"] = util.map_callback(function()
			actions.blame_line({ full = true })
		end)
			:with_buffer(buf)
			:with_desc("git: Blame line"),
		-- Text objects
		["ox|ih"] = util.map_callback(function()
			actions.text_object()
		end):with_buffer(buf),
	}
	util.nvim_load_mapping(map)
end

return mapping
