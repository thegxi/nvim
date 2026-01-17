return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  config = function()
    require('flash').setup({
      -- 标签字符
      labels = "asdfghjklqwertyuiopzxcvbnm",
      
      -- 搜索模式
      search = {
          -- 搜索模式: "exact", "fuzzy", "regex"
          mode = "exact",
          -- 是否排除搜索模式
          exclude = {
              "notify",
              "cmp_menu", 
              "noice",
              "flash_prompt",
          },
      },
      
      -- 跳转配置
      jump = {
          -- 自动跳转
          autojump = false,
          -- 没有匹配时是否跳转到第一个位置
          nohlsearch = false,
          -- 增量搜索
          incremental = true,
      },
      
      -- 标签配置
      label = {
          -- 大写还是小写标签
          uppercase = false,
          -- 是否在任何窗口中都显示标签
          reuse = "all",
          -- 标签位置: "eol" | "overlay" | "right" | "after" | "before"
          position = "eol",
          -- 是否彩虹色标签
          rainbow = {
              enabled = true,
              -- 色调数量
              shade = 5,
          },
          -- 透明背景
          transparent = false,
          -- 标签样式
          style = "overlay",
          -- 标签优先级
          priority = 5000,
      },
      
      -- 高亮配置
      highlight = {
          -- 匹配项高亮
          matches = true,
          -- 标签组
          groups = {
              match = "FlashMatch",
              current = "FlashCurrent",
              backdrop = "FlashBackdrop",
              label = "FlashLabel",
          },
      },
      
      -- 模式配置
      modes = {
          -- 字符搜索模式
          char = {
              enabled = true,
              -- 通过自动跳转到第一个匹配项来隐藏标签
              autohide = false,
              -- 使用正则表达式而不是精确匹配
              multi_line = false,
              -- 方向键
              keys = { "f", "F", "t", "T" },
              -- 字符模式搜索配置
              search = { wrap = false },
              -- 标签配置
              label = { exclude = "hkjlfdas" },
              -- 跳转
              jump = { register = false },
          },
          
          -- 搜索模式
          search = {
              enabled = true,
              -- `forward` 将跳转到下一个匹配项
              -- `stay` 将保持在当前匹配项
              jump = { history = true, register = true, nohlsearch = true },
              -- 搜索模式
              search = {
                  -- `forward` = true 将从光标位置向前搜索
                  -- `forward` = false 将从光标位置向后搜索
                  mode = "fuzzy",
                  exclude = {
                      "notify",
                      "cmp_menu",
                      "noice",
                      "flash_prompt",
                  },
              },
          },
          
          -- 树形搜索模式
          treesitter = {
              enabled = true,
              -- 装饰器
              decorate = function(match, state, tree)
                  -- 自定义装饰
                  return {
                      {
                          match.pos[1],
                          match.pos[2] + 1,
                          match.pos[3],
                          match.pos[4],
                      },
                      { hl_group = "FlashLabel" },
                  }
              end,
              -- 标签过滤器
              label = {
                  -- 只显示可见范围内的标签
                  before = true,
                  after = true,
                  style = "inline",
              },
              -- 跳转
              jump = { pos = "range" },
          },
          
          -- 远程操作模式
          remote = {
              enabled = true,
              -- 远程操作模式: "char", "search", "treesitter"
              mode = "char",
              -- 远程操作的跳转配置
              jump = { register = false },
          },
          
          -- 树形搜索模式
          treesitter_search = {
              enabled = true,
              -- 跳转
              jump = { pos = "range" },
              -- 搜索
              search = { multi_window = true, wrap = false },
              -- 树形搜索的标签
              label = { before = true, after = true, style = "inline" },
          },
      },
      
      -- 提示窗口
      prompt = {
          enabled = true,
          prefix = { { "🚀 ", "FlashPromptIcon" } },
          win_config = {
              relative = "editor",
              width = 1, -- 窗口宽度 <=1 是百分比，>1 是像素
              height = 1,
              row = -1, -- 从底部向上偏移
              col = 0,  -- 左侧偏移
              zindex = 1000,
          },
      },
      
      -- 杂项
      config = function(opts)
          -- 在 Neovim 启动时自动设置
      end,
      
      -- 钩子
      hooks = {
          before = function(state)
              -- 跳转前执行
          end,
          after = function(state)
              -- 跳转后执行
          end,
      },
    })
  end
}
