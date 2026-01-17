return {
  "yousefhadder/markdown-plus.nvim",
  ft = "markdown",
  config = function()
    require("markdown-plus").setup({
      -- Global enable/disable
      enabled = true,               -- default: true

      -- Feature toggles (all default: true)
      features = {
        list_management = true,     -- default: true (list auto-continue / indent / renumber / checkboxes)
        text_formatting = true,     -- default: true (bold/italic/strike/code + clear)
        headers_toc = true,         -- default: true (headers nav + TOC generation & window)
        links = true,               -- default: true (insert/edit/convert/reference links)
        images = true,              -- default: true (insert/edit image links + toggle link/image)
        quotes = true,              -- default: true (blockquote toggle)
        callouts = true,            -- default: true (GFM callouts/admonitions)
        code_block = true,          -- default: true (visual selection -> fenced block)
        table = true,               -- default: true (table creation & editing)
        footnotes = true,           -- default: true (footnote insertion/navigation/listing)
      },

      -- TOC window configuration
      toc = {
        initial_depth = 2,          -- default: 2 (range 1-6) depth shown in :Toc window and generated TOC
      },

      -- Callouts configuration
      callouts = {
        default_type = "NOTE",      -- default: "NOTE"  default callout type when inserting
        custom_types = {},          -- default: {}  add custom types (e.g., { "DANGER", "SUCCESS" })
      },

      -- Table configuration
      table = {
        auto_format = true,         -- default: true  auto format table after operations
        default_alignment = "left", -- default: "left"  alignment used for new columns
        confirm_destructive = true, -- default: true  confirm before transpose/sort operations
        keymaps = {                 -- Table-specific keymaps (prefix based)
          enabled = true,           -- default: true  provide table keymaps
          prefix = "<leader>t",     -- default: "<leader>t"  prefix for table ops
          insert_mode_navigation = true,  -- default: true  Alt+hjkl cell navigation
        },
      },

      -- Footnotes configuration
      footnotes = {
        section_header = "Footnotes",  -- default: "Footnotes"  header for footnotes section
        confirm_delete = true,          -- default: true  confirm before deleting footnotes
      },

      -- List configuration
      list = {
        checkbox_completion = {
          enabled = false,            -- default: false  add timestamps when checking tasks
          format = "emoji",           -- default: "emoji"  timestamp format (see below)
          date_format = "%Y-%m-%d",   -- default: "%Y-%m-%d"  os.date() format string
          remove_on_uncheck = true,   -- default: true  remove timestamp when unchecking
          update_existing = true,     -- default: true  update timestamp when re-checking
        },
      },

      -- Global keymap configuration
      keymaps = {
        enabled = true,             -- default: true  set false to disable ALL default maps (use <Plug>)
      },

      -- Filetypes configuration
      filetypes = { "markdown" },   -- default: { "markdown" }
    })

    -- NOTES:
    -- 1. Any field omitted uses its default value shown above.
    -- 2. Unknown fields trigger a validation error.
    -- 3. vim.g.markdown_plus (table or function) is merged BEFORE this setup() call.
    -- 4. setup() options override vim.g values; both override internal defaults.
  end
}
