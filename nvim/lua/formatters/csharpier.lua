local is_local_cache = nil
local csharpier_path = require('utils').get_builtin_bin('csharpier')

--- Verify if csharpier is installed locally.
---@return boolean
local function is_local()
  if is_local_cache == nil then
    if vim.fn.executable('dotnet') == 0 then
      -- if dotnet itself is not available, assume the csharpier executable
      is_local_cache = false
    else
      local version_check = vim.system({ 'dotnet', 'csharpier', '--version' }):wait()
      is_local_cache = version_check.code == 0
    end
  end
  return is_local_cache
end

---@module 'conform'
---@type conform.FormatterConfig
return {
  command = function()
    if is_local() then
      return 'dotnet'
    else
      return csharpier_path
    end
  end,

  args = function()
    if is_local() then
      return { csharpier_path, 'format', '--stdin-path', '$FILENAME' }
    else
      return { 'format', '--stdin-path', '$FILENAME' }
    end
  end,
}
