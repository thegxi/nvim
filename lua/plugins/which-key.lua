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
      delay = 150,
      timeout = 250,
      triggers = {
        { "<leader>", mode = { "n", " v" }}
      },
    })
  end
}
