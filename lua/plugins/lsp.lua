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
  -- lsp加载进度显示
  {
    "j-hui/fidget.nvim",
    tag = "v1.4.1",
  },
  -- lsp美化
  {
    "nvimdev/lspsaga.nvim"
  },
  -- buffer状态
  {
    "akinsho/bufferline.nvim", 
    config = true
  },
}
