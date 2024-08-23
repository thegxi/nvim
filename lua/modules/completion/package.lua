return {
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        config = require("modules.completion.snip"),
        dependencies = { "rafamadriz/friendly-snippets" }
      }
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    config = require("modules.completion.cmp")
	},
	-- lspsaga.nvim
	{
    "nvimdev/lspsaga.nvim",
	  lazy = true,
	  event = "LspAttach",
	  config = require("modules.completion.lspsaga"),
	  dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { 
        "williamboman/mason.nvim",
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = require("modules.completion.lspconfig"),
  },
  -- java
  {
    'nvim-java/nvim-java',
    dependencies = {
      { 'nvim-java/lua-async-await' },
      { 'nvim-java/nvim-java-core' },
      { 'nvim-java/nvim-java-test' },
      { 'nvim-java/nvim-java-dap' },
    }
  }
}
