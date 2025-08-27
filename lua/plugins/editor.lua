return {
  ------------------------------ Multi cursor  ------------------------------ 
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "BufReadPost",
     -- stylua: ignore
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
  },
  ------------------------------ Code comment ------------------------------ 
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  ------------------------------  Highlight and search for todo comments like TODO, HACK, BUG in your code base ------------------------------ 
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
    event = "BufReadPost",
    config = true,
  },
  ------------------------------  The copy-pasta rabbit hole ------------------------------ 
  {
    "ibhagwan/smartyank.nvim",
    event = { "BufWinEnter" },
    opts = {
      highlight = {
        enabled = true, -- highlight yanked text
        higroup = "IncSearch", -- highlight group of yanked text
        timeout = 500, -- timeout for clearing the highlight
      },
      clipboard = {
        enabled = true,
      },
      tmux = {
        enabled = true,
        -- remove `-w` to disable copy to host client's clipboard
        cmd = { "tmux", "set-buffer", "-w" },
      },
      osc52 = {
        enabled = true,
        -- escseq = 'tmux',     -- use tmux escape sequence, only enable if you're using tmux and have issues (see #4)
        ssh_only = true, -- false to OSC52 yank also in local sessions
        silent = true, -- true to disable the "n chars copied" echo
        echo_hl = "Directory", -- highlight group of the OSC52 echo message
      },
    },
  },
  ------------------------------ Search Integration ------------------------------ 
  {
    "folke/flash.nvim",
    event = "BufReadPost",
    opts = {
      label = {
        rainbow = {
          enabled = true,
          shade = 1,
        },
      },
      modes = {
        char = {
          enabled = false,
        },
      },
    },
  },
}
