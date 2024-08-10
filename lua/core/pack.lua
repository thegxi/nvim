local fn, api = vim.fn, vim.api
local data_dir = fn.stdpath('data')
local config_dir = fn.stdpath('config')
local modules_dir = config_dir .. '/lua/modules'
local lazy_path = data_dir .. "/lazy/lazy.nvim"

local lazy = {}

function lazy:load_modules()
  self.repos = {}
  local plugin_list = vim.fs.find('package.lua', { path = modules_dir, type = 'file', limit = 10 })
  if #plugin_list == 0 then
    return
  end
  
  for _, m in ipairs(plugin_list) do
		-- require modules returned from `get_plugins_list()` function.
    local _, pos = m:find(modules_dir)
		m = m:sub(pos - 6, #m - 4)
    local module = require(m)
		if type(module) == "table" then
			for name, conf in pairs(module) do
				self.repos[#self.repos + 1] = vim.tbl_extend("force", { name }, conf)
			end
		end
	end
end

function lazy:boot_lazy()
	if not vim.uv.fs_stat(lazy_path) then
    local cmd = '!git clone https://github.com/folke/lazy.nvim ' .. lazy_path
		api.nvim_command(cmd)
	end
	self:load_modules()
	vim.opt.rtp:prepend(lazy_path)
	require("lazy").setup(self.repos, {
    lockfile = vim.fs.joinpath(data_dir, 'lazy-lock.json'),
    dev = { path = "~/Workspace/nvim" }
  })
end

return lazy
