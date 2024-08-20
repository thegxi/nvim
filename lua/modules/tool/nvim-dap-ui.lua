return function()
  require("dapui").setup({
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
      },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = "",
    },
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.6,
          },
          {
            id = "watches",
            size = 0.4,
          },
        },
        position = "left",
        size = 40,
      },
      {
        elements = {
          {
            id = "stacks",
            size = 0.7,
          },
          {
            id = "breakpoints",
            size = 0.3,
          },
        },
        position = "right",
        size = 40,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.7,
          },
          {
            id = "console",
            size = 0.3,
          },
        },
        position = "bottom",
        size = 10,
      },
    },
    mappings = {
      edit = "e",
      expand = { "o", "<2-LeftMouse>" },
      open = "<CR>",
      remove = "d",
      repl = "r",
      toggle = "t",
    },
    render = {
      indent = 1,
      max_value_lines = 100,
    },
  })
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end
