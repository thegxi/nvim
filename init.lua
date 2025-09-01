vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require 'config.options'
require 'config.lazy'
require 'config.keymapping'

-- vim.lsp.enable('lua_ls',    { ft = { "lua" } })
-- vim.lsp.enable('bashls',    { ft = { "sh", "bash" } })
-- vim.lsp.enable('jsonls',    { ft = { "json" }})
-- vim.lsp.enable('pyright',   { ft = { "python" } })
-- vim.lsp.enable 'clangd'
-- vim.lsp.enable('jdtls',     { ft = { "java", "pom.xml", "class" } })

-- Lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.lsp.enable("lua_ls")
  end,
})

-- Bash
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash" },
  callback = function()
    vim.lsp.enable("bashls")
  end,
})

-- JSON
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.lsp.enable("jsonls")
  end,
})

-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.lsp.enable("pyright")
  end,
})

-- Java (jdtls)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.lsp.enable("jdtls")
  end,
})
