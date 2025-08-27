return {
  ------------------------------ Multi cursor  ------------------------------ 
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "BufReadPost",
     -- stylua: ignore
   keys = {
    -- Append/insert for each line of visual selections. Similar to block selection insertion.
    { "mI", function() require("multicursor-nvim").insertVisual() end, mode = "x", desc = "Insert cursors at visual selection" },
    { "mA", function() require("multicursor-nvim").appendVisual() end, mode = "x", desc = "Append cursors at visual selection" },
   },
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      -- Mappings defined in a keymap layer only apply when there are multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          mc.clearCursors()
        end)
      end)
    end,
  },
  ------------------------------ Go forward/backward with square brackets ------------------------------ 
  --   buffer     = { suffix = 'b', options = {} },
  --   comment    = { suffix = 'c', options = {} },
  --   conflict   = { suffix = 'x', options = {} },
  --   diagnostic = { suffix = 'd', options = {} },
  --   file       = { suffix = 'f', options = {} },
  --   indent     = { suffix = 'i', options = {} },
  --   jump       = { suffix = 'j', options = {} },
  --   location   = { suffix = 'l', options = {} },
  --   oldfile    = { suffix = 'o', options = {} },
  --   quickfix   = { suffix = 'q', options = {} },
  --   treesitter = { suffix = 't', options = {} },
  --   undo       = { suffix = 'u', options = {} },
  --   window     = { suffix = 'w', options = {} },
  --   yank       = { suffix = 'y', options = {} },
  {
    "echasnovski/mini.bracketed",
    version = "*",          -- 用最新稳定版
    event = "BufReadPost",  -- 打开文件后加载
    config = true,          -- 使用默认配置
  },
  ------------------------------ Go forward/backward with square brackets ------------------------------ 
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "BufReadPost",
    config = true,
    keys = {
      -- Disable the vanilla `s` keybinding
      { "s", "<NOP>", mode = { "n", "x", "o" } },
    },
  },
  ------------------------------ Text edit operators ------------------------------ 
  {
    "echasnovski/mini.operators",
    version = "*",
    event = "BufReadPost",
    opts = {
      replace = { prefix = "cr" },
    },
  },
  ------------------------------ Align text interactively ------------------------------ 
  {
    "echasnovski/mini.align",
    version = "*",
    event = "BufRead",
    opts = {
      mappings = {
        start = "gA",
        start_with_preview = "ga",
      },
    },
    config = function(_, opts)
      require("mini.align").setup(opts)
    end,
  },
  ------------------------------ Auto pair ------------------------------ 
  {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    opts={
        --Config goes here
    },
  }
}
