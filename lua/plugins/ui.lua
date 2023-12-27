return {
  -- Theme
  { 'projekt0n/github-nvim-theme' },
  { 'joshdick/onedark.vim' },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = require('plugins.ui.tokyonight'),
  }
}
