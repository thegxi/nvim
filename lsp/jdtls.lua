local M = {}

local mason_path = vim.fn.stdpath("data") .. "/mason"
local jdtls_bin = mason_path .. "/packages/jdtls/bin/jdtls"
local workspace_dir;

function M.find_root()
  local markers = { "mvnw", "gradlew", ".git", "pom.xml", "build.gradle" }
  for _, marker in ipairs(markers) do
    local path = vim.fn.finddir(marker, ".;")
    if path ~= "" then
      return vim.fn.fnamemodify(path, ":p:h")
    end
  end
  return vim.fn.getcwd()
end

function M.start()
  local root_dir = M.find_root()
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name
end

M.start()

M.cmd = { 
    jdtls_bin,
    "-data", workspace_dir,
    "--add-modules=ALL-SYSTEM"
}
M.filetypes = { "java" }
M.root_markers = { { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git" }, { "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" } }


return M
