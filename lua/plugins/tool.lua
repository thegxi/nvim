return {
  -- 模糊搜索
  {
     "nvim-telescope/telescope.nvim", tag = "0.1.6",
-- or                              , branch = "0.1.x",
      dependencies = { 
        "nvim-lua/plenary.nvim",
        { 
          "nvim-telescope/telescope-fzf-native.nvim", 
          build = "make" 
        }
      },
      config = function()
        require("plugins.tool.telescope")
      end
  },
  -- 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    build = ":TSUpdate",
    opts = {},
    config = function()
      require("plugins.tool.treesitter")
    end
  }
}
