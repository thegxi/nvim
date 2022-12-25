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

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- markdown
  use{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview", ft =  "markdown" }

  -- status line
  use 'nvim-lualine/lualine.nvim'

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

  -- lsp
  -- installer
   use({ "williamboman/mason.nvim" })
   use({ "williamboman/mason-lspconfig.nvim" })
   -- Lspconfig
   use({ "neovim/nvim-lspconfig" })
   -- 补全引擎
   use("hrsh7th/nvim-cmp")
   -- Snippet 引擎
   use("L3MON4D3/LuaSnip")
   use("saadparwaiz1/cmp_luasnip")
   -- 补全源
   use("hrsh7th/cmp-vsnip")
   use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
   use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
   use("hrsh7th/cmp-path") -- { name = 'path' }
   use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
   use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
   -- 常见编程语言代码段
   use("rafamadriz/friendly-snippets")
   -- UI 增强
   use("onsails/lspkind-nvim")
   use("tami5/lspsaga.nvim")
   -- 代码格式化
   use("mhartington/formatter.nvim")
   use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
   -- TypeScript 增强
   use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
   use("jose-elias-alvarez/typescript.nvim")

   -- Lua 增强
   use("folke/neodev.nvim")
   -- JSON 增强
   use("b0o/schemastore.nvim")
   -- Rust 增强
   use("simrat39/rust-tools.nvim")

  -- theme
  use 'lifepillar/vim-solarized8'
  use 'sainnhe/everforest'
  use 'ellisonleao/gruvbox.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'glepnir/zephyr-nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
