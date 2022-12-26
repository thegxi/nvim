require("mason").setup()
require("mason-lspconfig").setup_handlers({
  ["sumneko_lua"] = function() 
    require("lsp.config.lua")
  end,
  ["bashls"] = function()
    require("lsp.config.bash")
  end,
  ["pyright"] = function()
    require("lsp.config.pyright")
  end,
  ["html"] = function()
    require("lsp.config.html")
  end,
  ["cssls"] = function()
    require("lsp.config.css")
  end,
  ["emmet_ls"] = function()
    require("lsp.config.emmet")
  end,
  ["jsonls"] = function()
    require("lsp.config.json")
  end,
  ["tsserver"] = function()
    require("lsp.config.ts")
  end,
  ["rust_analyzer"] = function()
    require("lsp.config.rust")
  end,
  ["yamlls"] = function()
    require("lsp.config.yamlls")
  end,
})
