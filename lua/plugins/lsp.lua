return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },
    config = require("plugins.lsp.lspconfig")
  },
  -- 使用json定制化配置lsp
  {
    "folke/neoconf.nvim",
  },
  -- 辅助lsp识别neovim提供的api，不在提示警告
  { 
    "folke/neodev.nvim",
  },
}
