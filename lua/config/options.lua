local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true 
---- 使用空格代替tab
opt.expandtab = true

-- 防止包裹
opt.wrap = false

-- 光标行高亮
opt.cursorline = true

-- 雇用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认分屏新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索忽略大写
opt.ignorecase = true

-- 只搜索大写就只搜索大写
opt.smartcase = true

-- 外观
opt.termguicolors = true

-- 左侧多一列
opt.signcolumn = "yes"

-- 在退出之前确认是否保存修改
opt.confirm = true


-- vim.cmd "colorscheme tokyonight"
vim.cmd "colorscheme tokyonight-storm"
-- vim.api.nvim_command(
--   [[
--     hi Normal ctermfg=7 ctermbg=NONE cterm=NONE
--     colorscheme solarized8_high
--     let &t_SI .= '\e[5 q'
--     let &t_EI .= '\e[1 q'
--     let &t_vb = ''
--     let &t_ut = ''
--   ]]
-- )

