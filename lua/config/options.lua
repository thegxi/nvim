local opt = vim.opt

-- 行号与光标
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes" -- 永远显示 sign column (诊断标记)
opt.winborder = "rounded" -- 边框样式
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.scrolloff = 8 		    -- 光标上下至少保留8行
opt.sidescrolloff = 8 		    -- 光标左右至少保留8行
-- 换行统一
opt.fileformat = "unix" -- 设置文件默认保存格式为Unix (LF)
opt.fileformats = { "unix", "dos", "mac"} -- 设置文件格式检测优先级, Unix优先

-- 缩进与制表符
opt.expandtab = true 	 -- 插入tab时用空格代替
opt.tabstop = 2 		   -- tab显示为4列
opt.shiftwidth = 2 		 -- 缩进与反缩进操作的宽度
opt.autoindent = true  -- 新行继承前一行缩进
opt.smartindent = true -- 代码块中自动增加缩进

-- 搜索
opt.ignorecase = true       -- 搜索忽略大小写
opt.smartcase = true        -- 如果包含大写字符，则区分大小写
opt.hlsearch = false        -- 高亮所有匹配项(不在查找之后继续高亮匹配结果)
opt.incsearch = true        -- 输入时即时高亮匹配

-- 外观与显示
opt.termguicolors = true    -- 启用真彩色(24-bit)
opt.background = "dark"     -- 使用深色主题色
opt.showmode = false        -- 状态栏不显示模式
opt.mouse = "a"             -- 启用所有模式下鼠标支持
opt.wrap = false            -- 长行不自动换行
opt.list = true             -- 显示隐藏字符
opt.colorcolumn = { "80", "120" } -- 高亮某某一列推荐的最长长度
opt.listchars = { tab = "»·", trail = "·", nbsp = "␣" }  -- 'listchars' (lcs)

-- 文件与备份
opt.swapfile = false        -- 不生成.swp交换文件
opt.backup = false          -- 不保留备份文件
opt.writebackup = false     -- 写入时不先备份
opt.undofile = true         -- 启用跨会话undo(持久化撤销)

-- 编辑
opt.autoread = true         -- 文件外部修改时自动重载
opt.hidden = true           -- 切换buffer时不强制保存
opt.confirm = true          -- 对未保存/只读文件操作时提示
opt.updatetime = 300        -- 文件写入间隔(毫秒)
opt.timeoutlen = 200        -- 映射超时时间(毫秒)
opt.ttimeoutlen = 50        -- 键码超时时间(毫秒)

opt.clipboard = "unnamedplus" -- 共享系统剪切板


-- 状态栏与命令行
opt.laststatus = 2          -- 总是显示状态行,0:禁用;
opt.ruler = true            -- 状态栏显示列信息
opt.cmdheight = 1           -- 命令行高度为1行
opt.showcmd = true          -- 显示当前键入的命令

-- 兼容性与性能
opt.compatible = false      -- 非兼容模式(Neovim默认已经关闭，显示声明更安全)
opt.lazyredraw = true       -- 宏执行时不重绘

-- 缓存区
opt.splitbelow = true       -- 默认在下方打开
opt.splitright = true       -- 默认在右方打开
