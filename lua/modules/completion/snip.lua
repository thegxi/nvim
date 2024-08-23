return function()
	local luasnip = require('luasnip')

  local snippet_path = vim.fn.stdpath("config") .. "/snippets/" 
  if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
    vim.opt.rtp:append(snippet_path)
  end
    
  -- 设置 LuaSnip 的配置
  luasnip.config.set_config({
    history = true, -- 启用片段历史记录
    updateevents = 'TextChanged,TextChangedI', -- 更新事件
    delete_check_events = "TextChanged, InsertLeave",
  })

  -- 加载内置的代码片段
  require('luasnip/loaders/from_lua').lazy_load()
  require('luasnip/loaders/from_vscode').lazy_load()
  require('luasnip/loaders/from_snipmate').lazy_load()

  -- 你也可以加载自定义的代码片段文件
  -- luasnip.load_snippets("lua", require("path/to/your/snippets.lua"))
end
