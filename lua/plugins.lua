  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    print("Installing package manager packer.nvim into " .. install_path)
    vim.cmd "packadd packer.nvim"
  end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer.nvim don't exists")
  return
end
-- change auto reload
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({border = "single"})
    end
  }
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- analysis boot time
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }

  -- coc
  use {'neoclide/coc.nvim', branch = 'release'}

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
 
  -- markdown
  use 'iamcco/markdown-preview.nvim'

  -- status line 
  use 'yaocccc/nvim-lines.lua'

  -- float terminal
  use 'voldikss/vim-floaterm'

  -- chinese help document
  use {'yianwillis/vimcdoc', event = 'VimEnter'}

  -- nvim comment 
  use 'yaocccc/vim-comment'

  -- fzf
  use 'junegunn/fzf'
  use {'junegunn/fzf.vim', run = 'cd ~/.fzf && ./install --all', after = "fzf" }

  -- github copilot 
  use { 'github/copilot.vim', event = 'InsertEnter' }

  -- syntax highlight
  use { 'nvim-treesitter/nvim-treesitter', config = "require('plugconf/treesitter').setup()", run = ':TSUpdate', event = 'BufRead' }
  use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

  -- database ui
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui', config = "require('plugconf/nvim-dadbod').setup()", after = 'vim-dadbod' }

  -- fast select
   use { 'terryma/vim-expand-region', config = "require('plugconf/nvim-expand-region').setup()", event = 'CursorHold' }



  -- theme
  use 'lifepillar/vim-solarized8'
  use 'sainnhe/everforest'
  use 'ellisonleao/gruvbox.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'glepnir/zephyr-nvim' 
  use 'folke/tokyonight.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
