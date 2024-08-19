return function()
  local function filename_first(_, path)
    local tail = vim.fs.basename(path)
    local parent = vim.fs.dirname(path)
    if parent == "." then
      return tail
    end
    return string.format("%s\t\t%s", tail, parent)
  end

  local actions = require("telescope.actions")
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      -- sorting_strategy = "ascending", -- display results top->bottom
      -- layout_config = {
      --   prompt_position = "top",
      -- },
      path_display = function(opts, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
          return tail
        end
        return string.format("%s (%s)", tail, parent)
      end,
      mappings = {
        i = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        },
        n = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        },
      },
    },
  })
  telescope.load_extension("live_grep_args")
end
