return function()
  local conform = require("conform")

  local formatters = {
    -- Python
    {
      cmd = { "black", "-" }, -- 使用 black 的 stdin/stdout 模式
      filetypes = { "python" },
    },
    {
      cmd = { "isort", "-" }, -- 使用 isort 的 stdin/stdout 模式
      filetypes = { "python" },
    },

    -- Java
    {
      cmd = { "google-java-format", "--replace", "-" }, -- 使用 google-java-format 的 stdin/stdout 模式
      filetypes = { "java" },
    },
    -- 如果你使用 Maven 的 Spotless 插件，可以使用下面的配置
    -- {
    --   cmd = { "mvn", "com.diffplug.spotless:spotless-maven-plugin:apply" },
    --   filetypes = { "java" },
    -- },

    -- JavaScript / TypeScript
    {
      cmd = { "prettier", "--stdin-filepath", "%:p" }, -- 使用 --stdin-filepath 来处理文件路径
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    },

    -- Go
    {
      cmd = { "gofmt", "-w" },
      filetypes = { "go" },
    },

    -- C/C++
    {
      cmd = { "clang-format" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
    },

    -- Rust
    {
      cmd = { "cargo", "fmt" },
      filetypes = { "rust" },
    },

    -- JSON
    {
      cmd = { "jq", "." },
      filetypes = { "json" },
    },

    -- Markdown
    {
      cmd = { "prettier", "--stdin-filepath", "%:p" },
      filetypes = { "markdown" },
    },

    -- YAML
    {
      cmd = { "yq", "p", "-", "-" },
      filetypes = { "yaml" },
    },
  }

  conform.setup({
    formatters = formatters,
    format_on_save = {
      timeout_ms = 500, -- 设置格式化延迟，以避免在保存文件时立即格式化，防止编辑器卡顿
      post = { "m" }, -- 格式化后执行的命令，这里使用 'm' 来重新高亮显示
    },
    lsp_fallback = false, -- 如果 LSP 支持格式化，则优先使用 LSP，否则使用定义的格式化工具
  })

  -- 在 BufWritePre 事件中调用 conform.format_file() 来自动格式化文件
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
      local file_type = vim.bo.filetype
      local formatter = conform.get_formatter_for_filetype(file_type)

      if formatter then
        conform.format_file({
          async = true, -- 异步执行格式化
          formatter = formatter,
        })
      end
    end,
  })
end
