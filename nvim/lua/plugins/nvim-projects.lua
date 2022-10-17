local projects_status_ok, projects = pcall(require, 'project_nvim')
if not projects_status_ok then
  return
end

projects.setup {
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git" },
}

