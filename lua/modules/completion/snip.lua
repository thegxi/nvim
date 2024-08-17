return function()
	local luasnip = require('luasnip')
      
      -- 设置 LuaSnip 的配置
      luasnip.config.set_config({
        history = true, -- 启用片段历史记录
        updateevents = 'TextChanged,TextChangedI', -- 更新事件
      })

      -- 加载内置的代码片段
      require('luasnip/loaders/from_vscode').lazy_load()

      -- 你也可以加载自定义的代码片段文件
      -- luasnip.load_snippets("lua", require("path/to/your/snippets.lua"))
end
