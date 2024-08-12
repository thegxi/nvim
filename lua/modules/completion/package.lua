return {
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true
        },
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
	{
    "nvimdev/lspsaga.nvim",
	  lazy = true,
	  event = "LspAttach",
	  config = require("modules.completion.lspsaga"),
	  dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
