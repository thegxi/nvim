return function()
	local lualine = require("lualine")
	local icons = require("utils.icons")
	
	local function create_diagnostic_section()
	  return {
	    "diagnostics",
	    symbols = {
	      error = icons.diagnostics.Error,
	      warn = icons.diagnostics.Warn,
	      info = icons.diagnostics.Info,
	      hint = icons.diagnostics.Hint,
	    },
	  }
	end
	
	local function create_git_section()
	  local added, modified, removed = 0, 0, 0
	  -- 假设有一个函数来获取 gitsigns 状态，这里我们简化为固定值
	  -- 实际使用时，你需要根据你的环境来实现这部分逻辑
	  return {
	    "diff",
	    symbols = {
	      added = icons.git.added,
	      modified = icons.git.modified,
	      removed = icons.git.removed,
	    },
	    source = function()
	      return {
	        added = added,
	        modified = modified,
	        removed = removed,
	      }
	    end,
	  }
	end
	
	local function create_time_section()
	  return {
	    function()
	      return " " .. os.date("%R")
	    end,
	  }
	end
	
	lualine.setup({
	  options = {
	    theme = "auto",
	    globalstatus = vim.o.laststatus == 3,
	    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
	  },
	  sections = {
	    lualine_a = { "mode" },
	    lualine_b = { "branch" },
	    lualine_c = {
	      "filename",
	      create_diagnostic_section(),
	      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
	      { function() return vim.fn.expand('%:p') end }, -- 显示完整路径
	    },
	    lualine_x = {
	      create_git_section(), -- 简化的 git 状态
	      create_time_section(), -- 时间显示
	    },
	    lualine_y = {
	      { "progress", separator = " ", padding = { left = 1, right = 0 } },
	      { "location", padding = { left = 0, right = 1 } },
	    },
	    lualine_z = {
	      create_time_section(),
	    },
	  },
	  extensions = {}, -- 移除了扩展插件配置
	})
	
	-- 这里你可以添加自己的 autocmd 来动态更新 git 状态
	-- 例如监听 Git 状态变化的 autocmd
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	  callback = function()
	    -- 更新 git 状态的逻辑
	    -- 这里你可以调用 git 命令或使用 gitsigns API 来更新 `added`, `modified`, `removed`
	  end,
	})
end
