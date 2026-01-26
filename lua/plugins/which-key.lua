return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      delay = 400,
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "a", mode = { "n", "v" } },
      },
    })
  end
}
