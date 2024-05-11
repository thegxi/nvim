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
  },
  -- This plugin accelerates j/k mappings' steps while j or k key is repeating
  {
    "rainbowhxch/accelerated-jk.nvim",
    config = function()
      vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)')
      vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)')
    end,
  },
  -- automated session management
 {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      -- restore the session for the current directory
      vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
      -- restore the last session
      vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]])
      -- stop Persistence => session won't be saved on exit
      vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
    end,
  },
  -- 补全成对符号
  {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    config = true,
  },
  -- 打开文件，光标停留在上次修改的位置
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require'nvim-lastplace'.setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
      }
    end
  },
 -- lets you navigate your code with search labels
  {
    "folke/flash.nvim",
    config = function()
      vim.keymap.set({"n", "x", "o"}, "s", 
        function()
          require("flash").jump({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
          })
        end
      )
      vim.keymap.set({"n", "x", "o"}, "S", 
        function()
          require("flash").treesitter()
        end
      )
      vim.keymap.set({"o"}, "r", 
        function()
          require("flash").remote()
        end
      )
      vim.keymap.set({"o", "x"}, "R", 
        function()
          require("flash").treesitter_search()
        end
      )
    end,
  },
 -- markdown preview
 {
   "ellisonleao/glow.nvim",
   config = function()
      require("plugins.tool.glow")
   end
 },
 -- file system
 {
   "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",
   dependencies = {
     "nvim-lua/plenary.nvim",
     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
     "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
   },
   config = function()
      require("plugins.tool.neotree")
   end
 },
 -- keymap tip
 {
  "folke/which-key.nvim",
  config = true
 },
}
