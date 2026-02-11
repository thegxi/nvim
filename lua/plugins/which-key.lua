return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      plugins = {
        spelling = {
          -- 禁用拼写建议
          enabled = false,
          suggestions = 20,
        },
      },
      delay = 100,
      timeout = 200,
      triggers = {
        { "<leader>", mode = { "n", "v" }}
      },
    })
  end,
  dependencies = { 'nvim-mini/mini.icons', version = '*' }
}
