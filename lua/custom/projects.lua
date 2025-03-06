local M = {}

-- Function to add the current directory to projects
M.add_project = function()
  local current_directory = vim.fn.expand("%:p:h")
  local config_dir = vim.fn.stdpath("config")
  local projects_file = config_dir .. "/snacks_projects.lua"

  -- First load existing projects from file
  local existing_projects = {}
  local loaded_projects = loadfile(projects_file)
  if loaded_projects then
    existing_projects = loaded_projects() or {}
  end

  -- Initialize the global variable with loaded projects if it doesn't exist
  if not _G.snacks_custom_projects then
    _G.snacks_custom_projects = existing_projects
  else
    -- Merge file projects with any that might be in memory
    for _, path in ipairs(existing_projects) do
      table.insert(_G.snacks_custom_projects, path)
    end
  end

  -- Add the current directory
  table.insert(_G.snacks_custom_projects, current_directory)

  -- Remove duplicates
  local seen = {}
  local unique = {}
  for _, path in ipairs(_G.snacks_custom_projects) do
    if not seen[path] then
      seen[path] = true
      table.insert(unique, path)
    end
  end
  _G.snacks_custom_projects = unique

  -- Write updated projects to file
  local file = io.open(projects_file, "w")
  if file then
    file:write("return " .. vim.inspect(_G.snacks_custom_projects))
    file:close()
    vim.notify("Added " .. current_directory .. " to projects file")
  else
    vim.notify("Failed to write projects file", vim.log.levels.ERROR)
  end
end

-- Function to load and list projects with Snacks picker
M.list_projects = function()
  -- Try to load custom projects
  local projects = {}
  local ok, custom_projects = pcall(dofile, vim.fn.stdpath("config") .. "/snacks_projects.lua")

  if ok and type(custom_projects) == "table" then
    projects = custom_projects
  end

  -- Use these projects with the normal projects picker
  Snacks.picker.projects({ projects = projects })
end

return M
