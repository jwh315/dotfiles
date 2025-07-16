-- Auto-load all plugin files from the plugins directory
local plugins = {}

-- Get all lua files in the plugins directory
local plugin_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/plugins', '*.lua', false, true)

for _, file in ipairs(plugin_files) do
  local plugin_name = vim.fn.fnamemodify(file, ':t:r')
  local plugin_config = require('plugins.' .. plugin_name)
  
  if type(plugin_config) == 'table' then
    if plugin_config[1] then
      -- Multiple plugins in one file
      for _, plugin in ipairs(plugin_config) do
        table.insert(plugins, plugin)
      end
    else
      -- Single plugin
      table.insert(plugins, plugin_config)
    end
  end
end

return plugins
