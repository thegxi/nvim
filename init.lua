vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.neovide then
  require("neovide.neovide")
end

require 'config.options'
require 'config.lazy'
require 'config.keymapping'

vim.lsp.enable 'lua_ls'
vim.lsp.enable 'bashls'
vim.lsp.enable 'jsonls'
vim.lsp.enable 'pyright'
vim.lsp.enable 'clangd'
vim.lsp.enable 'jdtls'

