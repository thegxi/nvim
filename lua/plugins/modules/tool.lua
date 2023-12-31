return {
  --[[
  competitest.nvim  是一个 testcase 管理器和检查器。它通过自动化与测试用例管理相关的常见任务，节省了您在竞争性编程竞赛中的时间
  --]]
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = require('plugins.config.tool.competitest')
  },
  -- Terminal
  {
    'NvChad/nvterm',
    config = require('plugins.config.tool.nvterm')
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = require('plugins.config.tool.toggleterm')
  },
  -- Like search
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require('plugins.config.tool.telescope')
  },
  -- File manager
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    config = require('plugins.config.tool.nvim-tree')
  },
  -- Showing diagnostics, references, telescope results, quickfix
  {
    'folke/trouble.nvim',
    config = require('plugins.config.tool.trouble')
  },
  -- Keymap
  {
    'folke/which-key.nvim',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = require('plugins.config.tool.which-key')
  },
  -- Navigate your code with search labels,
  {
    'folke/flash.nvim',
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    config = require('plugins.config.tool.flash')
  }
}
