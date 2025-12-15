return {
  {
    "tpope/vim-dadbod",
    lazy = false,
    ft = { "sql" },
    config = function()
      vim.g.dbs = {
        mysql_local = "mysql://root:thegxi@127.0.0.1:3306/study"
      }
    end
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer"
    },
    dependencies = { "tpope/vim-dadbod" },
    lazy = false,
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = "~/Documents/Sql/db_ui_queries"
    end
  }
}
