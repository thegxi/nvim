vim.g.autoformat = true
vim.g.snacks_animate = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt
local wo = vim.wo

opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
-- 0 不隐藏任何东西，原样显示。
-- 1 隐藏有 conceal 标记的文本，但在文本处显示一个替代字符（默认是 conceal 选项的值，通常是一个空格或 ·）。
-- 2 隐藏有 conceal 标记的文本，不显示任何替代字符。
opt.conceallevel = 2 
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  -- 折叠相关
  foldopen = "",  -- 折叠打开
  foldclose = "", -- 折叠关闭
  fold = " ",      -- 折叠线不用点
  foldsep = " ",   -- 折叠分隔符留空

  -- Diff 模式
  diff = "╱",      -- diff 模式更优雅

  -- Buffer 尾部
  eob = " ",       -- 隐藏 ~

  -- 分隔线美化
  vert = "│",      -- 竖直分割
  horiz = "─",     -- 水平分割
  horizup = "┴",   -- 上拐角
  horizdown = "┬", -- 下拐角
  vertright = "├", -- 右拐角
  vertleft = "┤",  -- 左拐角
  verthoriz = "┼", -- 十字交叉
}
opt.foldlevel = 99
-- 如果 formatexpr 为空（默认），Vim 使用 formatprg 或内置格式化逻辑（比如根据 textwidth 自动换行）。
-- 如果 formatexpr 被设置，gq 就会调用你定义的函数 / 表达式来格式化
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()" 
-- t	当你输入时，超过 textwidth 会自动换行。
-- c	在注释中输入时，也会自动换行。
-- r	在注释里按 <Enter> 时，自动续写注释前缀。
-- o	在注释里按 o/O 新建行时，也会自动带上注释前缀。
-- q	允许用 gq 来格式化注释段落。
-- j	合并行时（比如 J），删除注释前的 //、* 等符号。
-- n	识别带数字的列表（1. xxx、2. xxx），在换行时自动继续。
-- 2	在第二行及以后保持缩进，常用于邮件风格引用 >。
-- a	自动格式化整个段落（比较激进，通常不推荐）。
-- w	在插入时，如果插入的单词超过 textwidth，就自动换行。
-- j → 删除注释行时，自动去掉注释符号。
-- l → 在长行里不拆开单词（只在空格处换行）。
opt.formatoptions = "jcroqlnt"
-- 告诉编辑器如何解析外部 grep 工具（如 grep / rg / ag）输出的结果，这样 :grep 之后可以把结果正确地加载进 quickfix 窗口
vim.opt.grepformat = "%f:%l:%c:%m"
-- 定义了 Neovim / Vim 执行 :grep 命令时真正调用的外部程序
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.ignorecase = true -- Ignore case
-- 实时预览替换命令 (:substitute) 的效果
-- inccommand="" 关闭（默认 Vim 的行为，不预览）。
-- inccommand="nosplit" 在 当前 buffer 内实时高亮匹配/替换的结果。 👉 一般用这个。
-- inccommand="split" 在 新窗口里显示预览。适合复杂替换时想清楚对比。
opt.inccommand = "nosplit" -- preview incremental substitute
-- stack	默认值，跳转会加入跳转列表（jump list）
-- nowrap	在跳转时不要触发行号 wrap
-- nosplit	避免分屏跳转（针对 tag 命令）
-- fuzzy	对搜索跳转启用模糊匹配
-- tab	在不同标签页跳转时不切换标签页
opt.jumpoptions = "stack"
-- 0   永不显示状态栏
-- 1   仅在有多个窗口时显示状态栏
-- 2   总是显示状态栏（每个窗口都有自己的状态栏）
-- 3   总是显示状态栏（只有一个全局的状态栏，Neovim 0.7+ 新增）
opt.laststatus = 3
-- 开启换行后,vim.wo.wrap = true,段落不会因为 textwidth 或窗口缩小而把单词硬截断 多行代码或文本在视觉上更整齐 搭配 showbreak 可以直观看到换行位置
opt.linebreak = true -- Wrap lines at convenient points
wo.showbreak = "↪ "     -- 换行行首标记
opt.breakat = " \t;:,!?" -- 换行可断字符
-- 用于控制 是否显示不可见字符（空格、制表符、换行符等）。
opt.list = true
-- n	普通模式启用鼠标
-- v	可视模式启用鼠标
-- i	插入模式启用鼠标
-- c	命令行模式启用鼠标
-- h	帮助窗口启用鼠标
-- a	全模式启用鼠标（等于 n,v,i,c,h）
-- r	终端模式启用鼠标（在 Neov
opt.mouse = "a"
opt.number = true -- Print line number
-- 控制 弹出补全菜单（popup menu）透明度。范围：0~100;0 → 完全不透明（默认）100 → 完全透明数值越大，补全菜单越透明。
opt.pumblend = 10
-- 用来控制 弹出补全菜单（popup menu）最大显示行数。
opt.pumheight = 10
opt.relativenumber = true -- Relative line numbers
-- 控制 状态栏右下角显示光标位置。
opt.ruler = false -- Disable the default ruler
-- 控制 光标周围保留的上下最小行数;当你移动光标接近屏幕边缘时，窗口会自动滚动，保证上下有空白区域
opt.scrolloff = 4
-- 用来控制 保存和恢复 session（会话）时的内容和行为。
-- buffers	保存所有已打开的 buffer
-- curdir	保存当前工作目录
-- tabpages	保存 tab 页结构
-- winsize	保存窗口大小/布局
-- folds	保存折叠状态
-- help	保存 help 窗口状态
-- blank	保存空白窗口
-- globals	保存全局变量（需要谨慎）
vim.opt.sessionoptions = {
  "buffers",   -- 保存所有已打开的 buffer
  "curdir",    -- 保存当前工作目录
  "tabpages",  -- 保存 tab 页布局
  "winsize",   -- 保存窗口大小/布局
  "help",      -- 保存 help 窗口状态
  "globals",   -- 保存全局变量（要小心，可能污染环境）
  "skiprtp",   -- 忽略运行时路径中的文件
  "folds"      -- 保存折叠状态
}
-- 控制 缩进命令（>> 和 <<）的对齐行为
-- 默认行为是：缩进按 shiftwidth 移动固定空格数，不会考虑行首对齐。
-- 开启 shiftround 后：缩进会向 shiftwidth 的倍数对齐，保证整齐的块状缩进
opt.shiftround = true
opt.shiftwidth = 2 -- 每次缩进 4 个空格
-- 控制 命令行消息和提示的显示方式
-- f	文件名太长时省略显示
-- i	插入模式提示信息省略
-- l	使用 :messages 查看时，重复消息不显示
-- n	新文件时不显示 [New File] 提示
-- x	错误信息不要输出“按 Enter 继续”
-- t	Truncate file messages (截断长信息)
-- T	Truncate other messages (如提示符消息)
-- o	重复信息不再显示
-- O	overwrite 消息覆盖旧消息
-- F	使用 file 命令时更简洁
-- W	不显示 “written” 文件保存提示（例如 "[W]"）
-- I	启动时忽略 Neovim 版本信息和插件消息
-- c	命令行补全提示信息更简洁，不显示 “match 1 of 5” 等完整信息
-- C	命令行补全信息更简洁，覆盖默认显示，不会重复显示提示
opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- 控制 光标左右滚动时的最小列边距，类似 scrolloff 控制上下行，但作用在水平方向
-- 数字 8 表示：光标左右至少保留 8 列
-- 当光标靠近屏幕左右边缘时，窗口会自动横向滚动，保证左右有空白区域
opt.sidescrolloff = 8 
-- 控制 标记列（sign column）的显示行为。标记列通常用于显示错误、警告、Git 修改标记、断点等符号
-- auto	当有标记需要显示时自动显示列
-- auto:NUMBER	最多显示 NUMBER 列，按需显示
-- yes	始终显示一列，避免文本左右跳动
-- no	不显示标记列
-- number	与行号共用一列（少用）
-- blink / rightleft	特殊显示模式，不常用
opt.signcolumn = "yes"
opt.smartcase = true -- Don't ignore case with capitals
-- Neovim 会在新行自动增加缩进，规则如下：
-- 如果上一行以 {、( 等代码块开始 → 下一行自动增加一个缩进层级
-- 如果上一行以 }、) 结尾 → 下一行自动减少一个缩进层级
-- 针对 C、C++、Java 等大括号语言效果最好
-- 与 autoindent 区别：
-- autoindent → 简单复制上一行缩进
-- smartindent → 结合代码结构，智能增加/减少缩进
opt.smartindent = true 
-- 设置 拼写检查的语言
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
-- 控制 在分屏（split）时光标所在内容的保持行为，主要目的是在创建新分屏或关闭分屏时，让光标和屏幕滚动更平滑
-- screen (默认)	尽量保持光标所在内容在屏幕上的位置不变
-- topline	尽量保持光标所在行在分屏顶部
-- cursor	只保持光标位置，不保证屏幕显示内容不变
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
-- 自定义 左侧状态栏（通常显示行号、折叠标记、符号列等）
-- %l	当前行号
-- %L	总行数
-- %s	signcolumn
-- %C	当前光标列
-- %>	对齐分隔符，用于自定义布局
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
-- 用于控制 Tab 键在显示上的宽度
opt.tabstop = 2 
-- 启用 终端真彩色 (24-bit RGB) 支持，从而使配色方案和插件的颜色显示更丰富、更精准。
opt.termguicolors = true
-- 用于控制 按键序列等待时间，也就是当你输入组合键（如 g + g 或 <leader> + x）时，等待第二个键的最长时间（毫秒）。
opt.timeoutlen = vim.g.vscode and 1000 or 500
-- 控制 是否开启文件级别的持久撤销（persistent undo）。开启后，每个编辑过的文件会生成一个 undo 文件，即使关闭 Neovim，也能恢复之前的编辑历史
opt.undofile = true
-- 控制 撤销（undo）操作的历史层数;数字 10000 表示最多可以撤销 10000 步操作;默认值通常是 1000;如果值为负数，则无限撤销
opt.undolevels = 10000
-- 控制 等待多长时间后触发 CursorHold 事件和写入 swap 文件。
opt.updatetime = 200
-- 控制光标在 虚拟位置（即行尾或空白区域之外的位置）的行为。
-- none	默认，光标只能在字符上
-- onemore	允许光标移动到行尾之后 1 个位置（方便插入）
-- all	允许光标移动到任意虚拟列，包括空行和行尾之外
-- block	对块选择模式生效，允许选择超出文本的区域
-- insert	仅在插入模式允许光标移动到虚拟列
-- visual	仅在可视模式允许光标移动到虚拟列
opt.virtualedit = "block" 
-- 控制 命令行自动补全的行为（如 :edit、:bnext、:w 等命令的补全）。使用 : 分隔多步补全顺序
-- full	补全整个匹配，按 Tab 切换下一个匹配;
-- longest	补全到匹配的最长公共前缀
-- list	列出所有匹配项
-- lastused	优先使用最近使用的匹配项
-- tagfile	用于补全标签文件
opt.wildmode = "longest:full,full" -- 第一次按 Tab → 补全到最长公共前缀 第二次按 Tab → 循环显示完整匹配 第三次按 Tab → 切换下一个完整匹配
-- 用于控制 窗口（split 窗口）最小宽度;当你有多个水平分屏（vertical split）时，Neovim 会根据窗口大小自动调整每个窗口的宽度。
-- winminwidth 决定 每个窗口缩小到多小仍然可见，防止窗口被压得太窄
opt.winminwidth = 5
