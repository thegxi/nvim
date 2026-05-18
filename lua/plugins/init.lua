local M = {}

local install_list = {}

M.plugins_list = {
  editor = {
    { src = "https://github.com/stevearc/oil.nvim" }, -- 文件管理
  },
  lsp = {
    { src = "https://github.com/neovim/nvim-lspconfig" }, -- lsp配置
    { src = "https://github.com/mason-org/mason.nvim" }, -- lsp安装
    { src = "https://github.com/stevearc/conform.nvim" }, -- 格式化配置
  },
  ui = {
    { src = "https://github.com/folke/tokyonight.nvim" }, -- 主题配色
    { src = "https://github.com/catppuccin/nvim" }, -- 主题配色
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- 文件图标
    { src = "https://github.com/akinsho/bufferline.nvim" },     -- bufferline
  },
  utils = {
    { src = "https://github.com/windwp/nvim-autopairs" },  -- 括号成对
    { src = "https://github.com/ibhagwan/fzf-lua" },       -- 搜索
    { src = "https://github.com/folke/flash.nvim" }, -- 跳转
    { src = "https://github.com/HiPhish/rainbow-delimiters.nvim" }, -- 彩虹括号
    { src = "https://github.com/DrKJeff16/project.nvim" }, -- 项目跳转
    { src = "https://github.com/kylechui/nvim-surround" }, -- 快捷添加括号与引号
    { src = "https://github.com/folke/which-key.nvim" },   -- 快捷键显示
    { src = "https://github.com/Youthdreamer/obsess" },    -- 专注任务面板
    { src = "https://github.com/kdheepak/lazygit.nvim" }, -- git
    { src = "https://github.com/nvim-lua/plenary.nvim" } -- lazygit依赖
  }
}

for _, group in pairs(M.plugins_list) do
  vim.list_extend(install_list, group)
end

vim.pack.add(install_list, { load = false })

vim.cmd([[colorscheme tokyonight-storm]])

require("plugins.editor")
require("plugins.lsp")
require("plugins.utils")

return M
