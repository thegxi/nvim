local map = vim.keymap.set

vim.api.nvim_create_autocmd("InsertEnter", {

  once = true,
  callback = function()
    -- autopairs
    require("nvim-autopairs").setup()
    -- surround
    require("nvim-surround").setup({
        --     Old text                    Command         New text
        -- --------------------------------------------------------------------------------
        --     surr*ound_words             ysiw)           (surround_words)
        --     surr*ound_words             ysiw(           ( surround_words )
        --     *make strings               ys$"            "make strings"
        --     [delete ar*ound me!]        ds]             delete around me!
        --     remove <b>HTML t*ags</b>    dst             remove HTML tags
        --     'change quot*es'            cs'"            "change quotes"
        --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
        --     delete(functi*on calls)     dsf             function calls
    })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CookLazy",
  callback = function()
    -- fzflua
    require("fzf-lua").setup()
    map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "查找文件" })
    map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "全局查找" })
    map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "缓冲区查找" })
    map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "最近使用文件查找" })
    map("n", "<leader>fs", "<cmd>FzfLua grep_cword<cr>", { desc = "当前单词查找" })
    map("n", "<leader>fk", "<cmd>FzfLua keymap<cr>", { desc = "查找快捷键" })
    map("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "查找快捷键" })
    map("n", "<leader>cR", function()
      vim.lsp.buf.rename()
    end, { desc = "LSP Rename" })
    map("n", "<leader>cd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "跳转定义" })
    map("n", "<leader>cr", "<cmd>FzfLua lsp_references<cr>", { desc = "引用" })
    map("n", "<leader>ci", "<cmd>FzfLua lsp_implementations<cr>", { desc = "实现" })
    map("n", "<leader>ct", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "类型定义" })
    map("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "代码操作" })
    map("n", "<leader>cs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "当前文件符号" })
    map("n", "<leader>cw", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "当前项目符号" })
    map("n", "<leader>cW", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "全局诊断" })
    map("n", "<leader>lw", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "当前项目符号" })

    -- project
    require("project").setup({
      fzf_lua = {
        enabled = true,
      },
      ignore_lsp = true,
    })
    vim.keymap.set("n", "<leader>fp", "<cmd>Project<cr>")

    -- which-key
    local wk = require("which-key")
    local opts = {
      preset = "helix",
    }
    wk.setup(opts)
    wk.add({
      { "<leader>e", group = " Oil", icon = "" },
      { "<leader>b", group = "缓冲区操作", icon = "" },
      { "<leader>f", group = "文件查找", icon = "󰈞" },
      { "<leader>c", group = "LSP操作", icon = "" },
      { "<leader>q", group = "退出编辑器", icon = "󰩈" },
      { "<leader>w", group = "窗口操作", icon = "" },
      { "<leader><tab>", group = "标签栏", icon = "󰓩" },
      { "<leader>o", group = "专注面板", icon = "" },
      { "<leader>u", group = "Undotree", icon = "󰕌" },
      { "<leader>l", group = "项目相关" },
    })

    -- obsess
    require("obsess").setup({
      position = "center",
      window = {
        width  = 60,
        height = 15,
        title  = "Obsess",
      },
      -- 倒计时结束后的弹窗提醒设置
      flash = {
        times = 15,        -- 闪烁次数
        interval_ms = 200, -- 每次间隔时间
      }
    })
    map("n", "<leader>os", "<cmd>ObsessToggle<CR>", { desc = "切换窗口" })
    map("n", "<leader>oc", "<cmd>ObsessClose<CR>", { desc = "注销" })
    map("n", "<leader>oo", "<cmd>ObsessTimer<CR>", { desc = "设置定时器(m)" })
    map("n", "<leader>ol", "<cmd>ObsessTimerSec<CR>", { desc = "设置定时器(s)" })
    map("n", "<leader>oa", "<cmd>ObsessTaskAdd<CR>", { desc = "添加任务" })
    map("n", "<leader>ot", "<cmd>ObsessTaskDone<CR>", { desc = "切换任务状态" })
    map("n", "<leader>od", "<cmd>ObsessTaskDel<CR>", { desc = "删除任务" })
    map("n", "<leader>oe", "<cmd>ObsessTaskClear<CR>", { desc = "清空任务列表" })
  end,
})

-- flash
map({"n", "x", "o"}, "s", function()
  local flash = require("flash")
  flash.jump()
end)
map({"n", "x", "o"}, "S", function()
  local flash = require("flash")
  flash.treesitter()
end)
map("o", "r", function()
  local flash = require("flash")
  flash.remote()
end)
map({"x", "o"}, "R", function()
  local flash = require("flash")
  flash.treesitter_search()
end)
map("c", "<a-s>", function()
  local flash = require("flash")
  flash.toggle()
end)

-- lazygit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
