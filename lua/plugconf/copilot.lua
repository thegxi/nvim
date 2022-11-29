local CONF = {}

function CONF.config()
  vim.g.copilot_no_tab_map = true 
  vim.api.nvim_set_keymap("i", "<Right>", "copilot#Accept('<Right>')", {script = true, silent = true, expr = true})
end

return CONF
