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

  -- theme
  use 'sainnhe/everforest'
  use 'ellisonleao/gruvbox.nvim'
  use 'EdenEast/nightfox.nvim'
  use({
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  })
  use 'folke/tokyonight.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
