vim.o.guifont = "Maple Mono:b"

vim.g.neovide_opacity = 0.9
vim.g.neovide_normal_opacity = 0.9

vim.g.neovide_input_macos_option_key_is_meta = "only_left"

-- -- Add keybinds to change transparency
local change_transparency = function(delta)
  vim.g.neovide_opacity = math.max(math.min(vim.g.neovide_opacity + delta, 1), 0)
  vim.g.neovide_normal_opacity = math.max(math.min(vim.g.neovide_normal_opacity + delta, 1), 0)
end
-- stylua: ignore
vim.keymap.set({ "n", "v", "o" }, "<D-]>", function() change_transparency(0.1) end)
-- stylua: ignore
vim.keymap.set({ "n", "v", "o" }, "<D-[>", function() change_transparency(-0.1) end)

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<D-=>", function()
  change_scale_factor(1.1)
end)
vim.keymap.set("n", "<D-->", function()
  change_scale_factor(1 / 1.1)
end)
--
-- -- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

if vim.g.neovide then
  -- 打开文件时，自动切换到文件所在目录（仅 Neovide 下生效）
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      if vim.fn.expand("%:p") ~= "" then
        vim.cmd("lcd %:p:h") -- 或者 "cd %:p:h" 如果你想全局切换
      end
    end,
  })
end
