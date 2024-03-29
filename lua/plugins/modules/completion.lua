return {
  -- Lsp
  { 
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('plugins.config.completion.lspconfig'),
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  },
  -- Lsp UI优化
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    },
    config = require('plugins.config.completion.lspsaga')
  },
  -- 补全源
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    ft = vim.g.fts,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          -- load snippets from path/of/your/nvim/config/my-cool-snippets
          require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets" } })
        end
      }
    },
    config = require('plugins.config.completion.cmp')
  },
  -- Inject LSP diagnostics, code actions, and more vIa Lua.
  {
    'nvimtools/none-ls.nvim',
    config = require('plugins.config.completion.none-ls')
  }
}
