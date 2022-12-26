require("mason").setup()
require("mason-lspconfig").setup({
  -- 自动安装 Language Servers
  automatic_installation = true,
  ensure_installed = { "rust_analyzer" },
})
