local jdtls = require('jdtls')

-- 工作空间目录 (每个项目一个)
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- 启动参数
local config = {
  cmd = {
    "java", -- 或者完整路径
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xmx1G",
    "-jar", "C:/Users/thegx/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar", -- 修改为实际路径
    "-configuration", "C:/Users/thegx/AppData/Local/nvim-data/mason/packages/jdtls/config_win", -- 修改为实际路径
    "-data", workspace_dir,
  },
  root_dir = jdtls.setup.find_root({'.git', 'mvnw', 'gradlew'}),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999
        }
      }
    }
  },
  init_options = {
    bundles = {}
  },
}

-- 启动 jdtls
jdtls.start_or_attach(config)
