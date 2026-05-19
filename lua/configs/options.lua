local cache_dir = vim.fn.stdpath("cache")
local vim_path = vim.uv.fs_realpath(vim.fn.stdpath("config"))
local options = {
	-- 文件被外部修改后自动重新读取
	autoread = true,
	-- 切换缓冲区等操作时自动保存
	autowrite = true,
	-- 保存文件前，先创建一个备份文件
	backup = false,
	-- 退格键行为控制
	-- indent: 删除处坂缩进
	-- eol: 可以跨行删除
	-- start: 可以删除进入插入模式前的字符
	backspace = "indent,eol,start",
	-- 备份文件位置
	backupdir = cache_dir .. "backup//,.",
	-- 设置某些文件不生成备份文件
	backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
	-- 指定自动换行时，允许在哪些字符后面断行,只在linebreak开启时生效
	breakat = [[\ \ ;:,!?@*-+/]],
	linebreak = true,
	-- 剪切板设置
	clipboard = "unnamedplus",
	-- 底部命令行高度
	-- cmdheight = 1,
	-- 1: 底部永远留一行
	-- 0: 没有底栏
	cmdheight = 1,
	-- 命令行窗口高度
	cmdwinheight = 5,
	-- 插入模式补全
	-- .: 当前buffer
	-- w: 其它窗口buffer
	-- b: 已加载buffer
	-- u: 未加载buffer
	-- t: tags
	-- k: dictionary
	-- s: spell
	-- i: include文件
	complete = ".,w,b,k,kspell",
	-- 配置补全菜单如何显示，如何选择
	-- fuzzy: 模糊匹配
	-- menuone: 即使只有一个候选，也显示补全菜单
	-- noselect: 不自动选择补全项
	-- popup: 用浮动窗口显示文档
	completeopt = "fuzzy,menuone,noselect,popup",
	-- 高亮当前列
	cursorcolumn = true,
	-- 高亮当前行
	cursorline = true,
	-- 控制diff模式行为
	-- algorithm:{name} diff算法{myers默认,minimal更精确,patience代码移动，大块修改，histogram现代推荐，indent-heuristic缩进优化}
	-- closeoff: 关闭最后一个diff窗口时退出diff模式
	-- filler: 空白填充行，保持左右窗口对齐
	-- followwrap: 考虑wrap
	-- internal: 使用neovim内置的diff引擎
	-- iwhite: 忽略空白字符差异
	-- iwhiteall: 忽略所有的空白字符
	-- iwhiteeol: 忽略行尾空白字符
	-- icase: 忽略大小写
	-- linematch:{n} 智能匹配
	-- vertical: 左右分屏
	diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
	-- swap文件保存目录
	directory = cache_dir .. "/swap//",
	-- 界面显示行为
	-- lastline: 最后一行尽量完整显示
	-- truncate: 长行超出窗口时，直接截断显示
	-- uhex: 显示Unicode十六进制值
	display = "lastline",
	encoding = "utf-8",
	-- 当窗口数量或大小变化时，自动让所有窗口重新平均分配大小
	equalalways = false,
	-- 出错时是否发出铃声
	errorbells = true,
	fileencodings = "ucs-bom,utf-8,default,big5,latin1",
	-- 换行符使用顺序
	fileformats = "unix,mac,dos",
	foldenable = true,
	-- 折叠层级
	foldlevelstart = 99,
	-- 折叠方式
	-- manual: 手动
	-- indent: 按缩进
	-- syntax: 按语法
	-- expr: 表达式
	-- marker: marker注释
	-- treesitter: treesitter插件
	foldmethod = "expr",
	-- 使用treesitter表达式折叠
	foldexpr = "nvim_treesitter#foldexpr()",
	-- 如何我解析grep输出格式
	-- %f: 文件名
	-- %l: 行号
	-- %c: 列号
	-- %m: 消息内容
	grepformat = "%f:%l:%c:%m",
	-- grep调用的实际程序
	grepprg = "rg --hidden --vimgrep --smart-case --",
	helpheight = 12,
	-- 未保存buffer是否允许被隐藏
	hidden = true,
	history = 2000,
	incsearch = true,
	infercase = true,
	-- 控制jump行为的细节
	-- stack: 浏览器后退，vscode中转历史
	-- view: 跳转同时保存视图状态
	jumpoptions = "stack,view",
	-- 状态栏什么时候显示
	-- 0: 永远不显示
	-- 1: 多个窗口时显示
	-- 2: 始终显示
	-- 3: 全局状态栏
	laststatus = 3,
	-- 是否显示不可见字符
	list = true,
	-- 不可见字符显示成什么
	-- tab: tab显示
	-- space: 普通空格
	-- trail: 行尾空格
	-- nbsp: 不断行空格
	-- extends: 超出右边界
	-- precedes: 左边被截断
	-- eol: 行尾符号
	listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
	magic = true,
	-- preview window高度
	previewheight = 12,
	-- 补全菜单透明度
	-- 0: 不透明
	-- 100: 完全透明
	pumblend = 10,
	-- 补全菜单最大高度
	pumheight = 15,
	-- 屏幕重绘超时时间
	redrawtime = 1500,
	-- 右下角显示光标位置信息
	ruler = true,
	-- 光标上下保留行数
	scrolloff = 8,
	-- session保存哪些内容
	-- buffers: 保存buffer
	-- curdir: 保存cwd
	-- folds: 保存fold
	-- tabpages: 保存tab
	-- winpos: 保存窗口位置
	-- winsize: 保存窗口大小
	-- help: 保存help window
	-- terminal: 保存terminal
	-- globals: 保存全局变量
	sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
	-- 如何持久化历史数据
	-- !: 保存并恢复全局变量,仅限大写字母开头
	-- '500: 最多保存500个文件marks
	-- <50: 每个寄存器最多保存50行
	-- @100: 保存100条输入历史
	-- s10: 单个item最大10KB
	-- h: 不保存hlsearch状态
	shada = "!,'500,<50,@100,s10,h",
	-- >><等缩进操作时是否自动对齐到shiftwidth
	shiftround = true,
	-- 控制提示信息显示
	-- a: 使用简短消息
	-- o: overwrite message
	-- O: 减少多文件message
	-- T: 长message截断
	-- I: 关闭启动页
	-- c: 减少补全message
	-- F: 减少file info
	shortmess = "aoOTIcF",
	-- 长行自动换行后，续行前显示的前缀字符
	showbreak = "↳  ",
	-- 显示正在输入的命令,状态栏中已经显示，故关闭
	showcmd = false,
	-- 是否显示当前模式,状态栏中已经显示，故关闭
	showmode = false,
	-- tabline什么时候显示
	-- 0: 永远不显示
	-- 1: 只有多个tab时显示
	-- 2: 始终显示
	showtabline = 2,
	-- 水平滚动时左右保留列数
	sidescrolloff = 5,
	-- 搜索时不区分大小写,必须配置ignorecase
	ignorecase = true,
	smartcase = true,
	-- tab在行首时使用shiftwidth
	smarttab = true,
	-- 平滑滚动显示，屏幕不会跳
	smoothscroll = true,
	-- 是否启用拼写检查
	spell = false,
	-- 用户自定义拼写词典文件,配合spell设置
	spellfile = vim_path .. "/spell/en.utf-8.add",
	-- 水平split是否开在下方
	splitbelow = true,
	-- split时如何保持当前屏幕视图稳定
	-- cursor: 保持光标附件稳定
	-- screen: 保持整个screen稳定
	splitkeep = "screen",
	-- 垂直split是否开在右边
	splitright = true,
	-- 是否创建swap文件
	swapfile = false,
	-- 当命令中转到buffer时，如何处理窗口
	-- useopen: 使用已打开的窗口
	-- usetab: 切换到已有tab
	-- split: 新split
	-- vsplit: 新vertical split
	-- newtab: 新tab
	-- uselast: 优先使用上一次访问的窗口
	switchbuf = "usetab,uselast",
	-- 启用真彩色
	termguicolors = true,
	-- 是否等待映射按键映射
	timeout = true,
	-- 映射等待时间
	timeoutlen = 300,
	-- 是否等待终端按键码超时
	ttimeout = true,
	-- 终端按键等待时间
	ttimeoutlen = 0,
	undodir = cache_dir .. "/undo//",
	-- 空闲更新时间
	updatetime = 200,
	-- 控制mkview保存哪些内容
	-- folds: 保存fold
	-- cursor: 保存光标位置
	-- slash: 保存search
	-- options: 保存local options
	-- unix: unix换行
	-- curdir: 当前工作目录
	viewoptions = "folds,cursor,curdir,slash,unix",
	-- 允许光标进入虚拟位置,比如空白区
	-- block: visual block可越界
	-- insert: insert mode可虚拟编辑
	-- all: 所有情况都允许
	virtualedit = "block",
	-- 用视觉提示代替峰鸣
	visualbell = true,
	-- 哪些按键允许跨行移动
	whichwrap = "h,l,<,>,[,],~",
	-- 命令补全时忽略哪些文件
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
	-- wildmenu/file completion时是否忽略大小写
	wildignorecase = true,
	-- 浮动窗口透明度
	-- 0: 不透明
	-- 100: 完全透明
	winblend = 10,
	-- 非当前窗口允许缩小到的最小宽度
	winminwidth = 10,
	-- 当前活动窗口保持的最小宽度,30列
	winwidth = 30,
	-- 搜索到文件末尾后是否从头继续搜索
	wrapscan = true,
	-- 写文件前是否创建临时备份
	writebackup = true,
	-- 新行自动继承上一行缩进
	autoindent = true,
	-- wrap后，续行缩进的细节,必须配合breakindent
	-- shift:N 续行额外缩进N
	-- min:N 最小文本宽度
	-- sbr: 考虑showbreak
	breakindent = true,
	breakindentopt = "shift:2,min:20",
	-- 哪些模式下启用conceal
	-- n: normal
	-- v: visual
	-- i: insert
	-- c: command
	concealcursor = "niv",
	-- **bold**显示成bold,而**被隐藏
	-- 0: 不隐藏，完整原文
	-- 1: 部分隐藏
	-- 2: 隐藏
	-- 3: 更激进conceal
	conceallevel = 0,
	-- tab是否转换为空格
	expandtab = true,
	-- 是否启用代码折叠
	foldenable = true,
	-- 自动格式化行为规则
	-- t: 自动文本换行,输入超过textwidth值时自动换行
	-- c: 注释自动换行
	-- r: 按enter自动继续注释
	-- o: 使用o时自动继续注释
	-- q: 允许gq格式化文本
	-- j: 删除注释行时，自动移除comment leader,防止注释断裂
	-- n: 识别numbered list自动续行
	-- 2: 第二行开始时使用第一行缩进
	-- a: 自动段落格式化
	-- l: 长行不会因为insert而再次格式化
	formatoptions = "1jcroql",
	number = true,
	relativenumber = true,
	-- 自动缩进时使用多少空格
	shiftwidth = 4,
	-- 左侧sign gutter是否显示
	-- auto: 有sign才显示
	-- yes: 始终显示
	-- no: 不显示
	-- yes:2 始终保留2列
	signcolumn = "yes",
	-- <tab>和<bs>编辑是视为多少空格
	softtabstop = 4,
	-- tab显示宽度,只影响显示，不决定实际插入多少空格
	tabstop = 4,
	-- 语法高亮最多解析到第几列
	synmaxcol = 500,
	-- 输入超过多少列自动换行,0关闭自动换行
	textwidth = 0,
	-- 是否持久化undo
	undofile = true,
	-- 长行是否视觉换行
	wrap = false,
}

local function load_options()
	for name, value in pairs(options) do
		vim.api.nvim_set_option_value(name, value, {})
	end
end

load_options()
