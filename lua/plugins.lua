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
  -- lspconfig
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- cmp completion and other enhance
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'

  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
