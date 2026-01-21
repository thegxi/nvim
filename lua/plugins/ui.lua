return {
  -- Colorscheme
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      -- vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_foreground = "mix"
      -- vim.g.gruvbox_material_foreground = "original"
      vim.cmd.colorscheme('gruvbox-material')
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local colors = {
        red = '#ca1243',
        yellow = '#fe8019',
        green = '#8ec07c',
        blue = '#51afef',
      }
      require("lualine").setup{
        options = { 
          component_separators = "",
          section_separators = { left = "", right = "" },
          theme = "gruvbox-material" 
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            {
              "diagnostics",
              source = { "nvim" },
              sections = { "error" },
              diagnostics_color = { error = { bg = colors.red, fg = "#ffffff" } }
            },
            {
              'diagnostics',
              source = { 'nvim' },
              sections = { 'warn' },
              diagnostics_color = { warn = { bg = colors.yellow, fg = '#ffffff' } }
            },
            { 'filename', path = 1 },
            { 
              function() return vim.bo.modified and '+' or (vim.bo.readonly and '-' or '') end,
              color = { bg = colors.red } 
            },
          },
          lualine_y = { 'filetype' },
          lualine_z = { '%l:%c', '%p%%/%L' },
        }
      }
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
  }
}
