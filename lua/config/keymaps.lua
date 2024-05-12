vim.g.mapleader = " "

local keymap = vim.keymap

-- -------------------------- 插入模式 -----------------------------
keymap.set("i", "<C-[>", "<ESC>")
keymap.set("i", "<C-s>", "<ESC><CMD>w<CR>")
keymap.set("i", "<C-q>", "<ESC><CMD>q!<CR>")
keymap.set("i", "<A-j>", "<ESC><CMD>m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<ESC><CMD>m .-2<CR>==gi")

-- -------------------------- 视图模式 -----------------------------
-- 单行或多行移动
keymap.set("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", "<CMD>m '>-2<CR>gv=gv")

-- -------------------------- 普通模式 -----------------------------
-- 编辑
keymap.set("n", "W", "<CMD>w<CR>")
keymap.set("n", "Q", "<CMD>q<CR>")
keymap.set("n", "<C-s>", "<CMD>w<CR>")
keymap.set("n", "<C-q>", "<CMD>q!<CR>")
-- 窗口
keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==")
keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==")
---- 水平新增窗口
keymap.set("n", "<leader>sv", "<C-w>v")
---- 垂直新增窗口
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

---- 调节窗口大小
keymap.set("n", "<C-up>", "<CMD>resize +2<CR>")
keymap.set("n", "<C-Down>", "<CMD>resize -2<CR>")
keymap.set("n", "<C-Left>", "<CMD>vertical resize -2<CR>")
keymap.set("n", "<C-Right>", "<CMD>vertical resize +2<CR>")


-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- buffer
keymap.set("n", "[b", "<CMD>BufferLineCyclePrev<CR>")
keymap.set("n", "]b", "<CMD>BufferLineCycleNext<CR>")
keymap.set("n", "bD", "<CMD>BufferLinePickClose<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
keymap.set("n", "<leader>sd", "<CMD>Telescope diagnostics<CR>")
keymap.set("n", "<leader>sk", "<CMD>Telescope keymaps<CR>")
keymap.set("n", "<leader>sr", "<CMD>Telescope resume<CR>")
keymap.set("n", "<leader>s.", "<CMD>Telescope oldfiles<CR>")

-- neotree(file system)
keymap.set({"n", "v"}, "<leader>e", "<CMD>Neotree toggle<CR>")
--keymap.set({"n", "v"}, "<leader>b", "<CMD>Neotree buffers<CR>")
