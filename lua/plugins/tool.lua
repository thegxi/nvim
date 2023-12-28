return {
  --[[
  competitest.nvim  是一个 testcase 管理器和检查器。它通过自动化与测试用例管理相关的常见任务，节省了您在竞争性编程竞赛中的时间
  --]]
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = require('plugins.tool.competitest')
  }
}
