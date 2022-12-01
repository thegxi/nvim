local MD = {}

function MD.config()
  vim.g.mkdp_page_title = '${name}'
  vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
  vim.g.mkdp_theme = 'dark'
  vim.g.vmt_fence_text = 'markdown-toc'
end

return MD
