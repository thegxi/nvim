return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      require("render-markdown").setup({
        completions = { lsp = { enable = true }}
      })
    end
  }
}
