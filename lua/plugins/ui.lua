return {
  ------------------------------ Colorscheme ------------------------------ 
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        -- stylua: ignore
        return {
          LineNr     = { fg = colors.surface2 },
          Visual     = { bg = colors.overlay0 },
          Search     = { bg = colors.surface2 },
          IncSearch  = { bg = colors.mauve },
          CurSearch  = { bg = colors.mauve },
          MatchParen = { bg = colors.mauve, fg = colors.base, bold = true },
        }
      end,
      integrations = {
        barbar = true,
        blink_cmp = true,
        gitsigns = true,
        mason = true,
        noice = true,
        nvimtree = true,
        rainbow_delimiters = true,
        snacks = {
          enabled = true,
          indent_scope_color = "flamingo", -- catppuccin color (eg. `lavender`) Default: text
        },
        which_key = true,
        flash = true,
        lsp_trouble = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  ------------------------------ Git ------------------------------ 
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      signcolumn = false,
      numhl = true,
      -- word_diff = true,
      current_line_blame = true,
      attach_to_untracked = true,
      preview_config = {
        border = "rounded",
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        -- stylua: ignore
        map("n", "]h", function() if vim.wo.diff then vim.cmd.normal({ "]h", bang = true }) else gitsigns.nav_hunk("next") end end, { desc = "[Git] Next hunk" })
        -- stylua: ignore
        map("n", "]H", function() if vim.wo.diff then vim.cmd.normal({ "]H", bang = true }) else gitsigns.nav_hunk("last") end end, { desc = "[Git] Last hunk" })
        -- stylua: ignore
        map("n", "[h", function() if vim.wo.diff then vim.cmd.normal({ "[h", bang = true }) else gitsigns.nav_hunk("prev") end end, { desc = "[Git] Prev hunk" })
        -- stylua: ignore
        map("n", "[H", function() if vim.wo.diff then vim.cmd.normal({ "[H", bang = true }) else gitsigns.nav_hunk("first") end end, { desc = "[Git] First hunk" })

        -- Actions
        map("n", "<leader>ggs", gitsigns.stage_hunk, { desc = "[Git] Stage hunk" })
        -- stylua: ignore
        map("v", "<leader>ggs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[Git] Stage hunk (Visual)" })

        map("n", "<leader>ggr", gitsigns.reset_hunk, { desc = "[Git] Reset hunk" })
        -- stylua: ignore
        map("v", "<leader>ggr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[Git] Reset hunk (Visual)" })

        map("n", "<leader>ggS", gitsigns.stage_buffer, { desc = "[Git] Stage buffer" })
        map("n", "<leader>ggR", gitsigns.reset_buffer, { desc = "[Git] Reset buffer" })

        map("n", "<leader>ggp", gitsigns.preview_hunk, { desc = "[Git] Preview hunk" })
        map("n", "<leader>ggP", gitsigns.preview_hunk_inline, { desc = "[Git] Preview hunk inline" })

        -- map("n", "<leader>ggb", function() gitsigns.blame_line({ full = true }) end, { desc = "[Git] Blame line" })

        -- stylua: ignore
        map("n", "<leader>ggd", gitsigns.diffthis, { desc = "[Git] diff" })
        -- stylua: ignore
        map("n", "<leader>ggD", function() gitsigns.diffthis("~") end, { desc = "[Git] diff (ALL)" })

        -- stylua: ignore
        map("n", "<leader>ggQ", function() gitsigns.setqflist("all") end, { desc = "[Git] Show diffs (ALL) in qflist" })
        -- stylua: ignore
        map("n", "<leader>ggq", gitsigns.setqflist, { desc = "[Git] Show diffs in qflist" })

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "[Git] Current hunk" })

        -- Toggles
        require("snacks")
          .toggle({
            name = "line blame",
            get = function()
              return require("gitsigns.config").config.current_line_blame
            end,
            set = function(enabled)
              require("gitsigns").toggle_current_line_blame(enabled)
            end,
          })
          :map("<leader>tgb")
        require("snacks")
          .toggle({
            name = "word diff",
            get = function()
              return require("gitsigns.config").config.word_diff
            end,
            set = function(enabled)
              require("gitsigns").toggle_word_diff(enabled)
            end,
          })
          :map("<leader>tgw")
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      -- require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  ------------------------------ Lualine ------------------------------ 
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "AndreM222/copilot-lualine",
    },
    event = "BufWinEnter",
    opts = {
      options = {
        theme = "catppuccin",
        always_divide_middle = false,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = { "encoding", "fileformat", "filetype", "progress" },
        lualine_z = { "location" },
      },
      -- stylua: ignore
      winbar = {
        lualine_a = { "filename", },
        lualine_b = { { function() return " " end, color = "Comment", }, },
        lualine_x = { "lsp_status", },
      },
      inactive_winbar = {
        -- Always show winbar
        -- stylua: ignore
        lualine_b = { function() return " " end, },
      },
    },
    config = function(_, opts)
      local mocha = require("catppuccin.palettes").get_palette("mocha")

      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return ""
        else
          return "󰑋 " .. recording_register
        end
      end

      local macro_recording = {
        show_macro_recording,
        color = { fg = "#333333", bg = mocha.red },
        separator = { left = "", right = "" },
        padding = 0,
      }

      local copilot = {
        "copilot",
        show_colors = true,
        symbols = {
          status = {
            hl = {
              enabled = mocha.green,
              sleep = mocha.overlay0,
              disabled = mocha.surface0,
              warning = mocha.peach,
              unknown = mocha.red,
            },
          },
          spinner_color = mocha.mauve,
        },
      }

      table.insert(opts.sections.lualine_x, 1, macro_recording)
      table.insert(opts.sections.lualine_c, copilot)

      require("lualine").setup(opts)
    end,
  },
  ------------------------------ Icons ------------------------------ 
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        copilot = {
          icon = "",
          color = "#cba6f7", -- Catppuccin.mocha.mauve
          name = "Copilot",
        },
      },
    },
  },
  ------------------------------ Show colors in the text: e.g. "#b3e2a7" ------------------------------ 
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    submodules = false,
    config = true,
    main = "rainbow-delimiters.setup",
  },
  ------------------------------ Syntax high light ------------------------------ 
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    -- branch = "main",
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,

        disable = { "verilog", "systemverilog", "latex" },
      },
      indent = {
        enabale = true,
        disable = {
          "markdown", -- indentation at bullet points is worse
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      -- separator = nil,
      separator = "─",
      zindex = 20, -- The Z-index of the context window
    },
    -- stylua: ignore
    keys = {
      { "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end, mode = { "n" }, desc = "TS go to context", silent = true, },
    },
    config = function(_, opts)
      local configs = require("treesitter-context")

      -- vim.keymap.set("n", "[c", function()
      --   require("treesitter-context").go_to_context(vim.v.count1)
      -- end, { silent = true })

      configs.setup(opts)
    end,
  },
  ------------------------------ Buffers ------------------------------ 
  {
    "romgrk/barbar.nvim",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
      -- Automatically hide the tabline when there are this many buffers left.
      -- Set to any value >=0 to enable.
      auto_hide = 1,
      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        -- Default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = {
          text = "NvimTree",
          event = "BufWinLeave",
        },
        undotree = {
          text = "UndoTree",
        },
      },
    },
    lazy = false,
    -- event = { "VeryLazy" },
    -- stylua: ignore
    keys = {
    },
  },
  ------------------------------ Buffers ------------------------------ 
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = { "n" }, desc = "[NvimTree] Toggle NvimTree" },
    },
    opts = {
      update_focused_file = {
        enable = true,
      },
    },
  },
}
