-- Lua/plugins/blink-cmp.lua
local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end
return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { 
    "xzbdmw/colorful-menu.nvim", opts = {},
    "rafamadriz/friendly-snippets"
  },
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    completion = {
      documentation = {
        auto_show = true
      },
      -- 补全菜单颜色
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx) 
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end
            }
          }
        }
      }
    },
    keymap = {
      -- 文档翻页
      ['<Tab>'] = { 'select_and_accept', 'fallback' }
    },
    -- 函数参数提示
    signature = {
      enabled = true
    },
    -- 命令模式补全
    cmdline = {
      -- 命令行行为与默认模式一致
      keymap = { preset = 'inherit' },
      completion = {
        menu = {
          auto_show = true
        }
      }
    },
    -- 补全源
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        snippets = { score_offset = 1000 }
      }
    }
  }
}
