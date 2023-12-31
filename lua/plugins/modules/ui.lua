return {
  -- Theme
  { 'projekt0n/github-nvim-theme' },
  { 'joshdick/onedark.vim' },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = require('plugins.config.ui.tokyonight')
  },
  -- Git info
  { 
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufRead', 'BufNewFile' },
    config = require('plugins.config.ui.gitsigns')
  },
  -- Indent
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = { 'BufRead', 'BufNewFile' },
    config = require('plugins.config.ui.indent-blankline')
  },
  -- Notify
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    config = require('plugins.config.ui.notify')
  },
  {
    'j-hui/fidget.nvim',
    tag = 'v1.0.0',
    config = require('plugins.config.ui.fidget')
  },
  -- Colorizer 
  {
    'NvChad/nvim-colorizer.lua',
    lazy = true,
    event = { 'BufRead', 'BufNewFile' },
    config = require('plugins.config.ui.colorizer')
  },
  -- Git
  {
    'ewis6991/gitsigns.nvim',
    config = require('plugins.config.ui.gitsigns')
  }
}
