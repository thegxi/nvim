vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")


-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function (args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--         -- 关键：启用原生补全
--         -- if client and client.server_capabilities.completionProvider then
--         -- vim.lsp.completion.enable(true, client.id, args.buf, {
--         --     autotrigger = true, -- 自动弹出补全
--         -- })
--         -- end
--
--         -- 常用 LSP 快捷键（随便留几个核心的）
--         local bufopts = { noremap = true, silent = true }
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
--         vim.lsp.buf.format({ async = true })
--     end
-- })


-- 补全菜单行为（非常关键）
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "fuzzy" }

-- 手动触发补全（正确方式）
-- vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true })

-- 选择补全项
-- vim.keymap.set("i", "<C-n>", function()
  -- return vim.fn.pumvisible() == 1 and "<C-n>"
-- end, { expr = true })

-- vim.keymap.set("i", "<C-p>", function()
--   return vim.fn.pumvisible() == 1 and "<C-p>"
-- end, { expr = true })

-- 确认
-- vim.keymap.set("i", "<Tab>", function()

-- end, { expr = true })

vim.lsp.enable({
	"clangd",
	"lua_ls",
	"ty",
    "pyright",
	"rust_analyzer",
	"gopls",
})
