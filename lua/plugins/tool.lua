return {
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
}
