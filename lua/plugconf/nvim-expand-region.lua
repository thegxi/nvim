local CONF = {}

function CONF.config()
  vim.api.nvim_set_keymap("v", "v", "<Plug>(expand_region_expand)", {silent = true})
  vim.api.nvim_set_keymap("v", "V", "<Plug>(expand_region_shrink)", {silent = true})
end

function CONF.setup()
    -- do nothing
end

return CONF
