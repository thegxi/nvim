return {
  -- Theme
  { 'projekt0n/github-nvim-theme' },
  { 'joshdick/onedark.vim' },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = require('plugins.ui.tokyonight')
  },
  -- Git info
  { 
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufRead', 'BufNewFile' },
    config = require('plugins.ui.gitsigns')
  },
  -- Indent
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = { 'BufRead', 'BufNewFile' },
    config = require('plugins.ui.indent-blankline')
  }
}
