---@module 'snacks'

local M = {}

---@type string[]
M.snacks_picker_exclude = {
  'node_modules',
  '.git',
  '.direnv',
  '.svelte-kit',
  'package-lock.json',
  'yarn.lock',
  'pnpm-lock.yaml',
  'flake.lock',
  'dist',
  'build',
  'out',
}

---@type snacks.picker.files.Config
M.snacks_picker_files_config = {
  cmd = 'fd',
  hidden = true,
  exclude = M.snacks_picker_exclude,
}

---@type snacks.picker.grep.Config
M.snacks_picker_grep_config = {
  cmd = 'rg',
  hidden = true,
  exclude = M.snacks_picker_exclude,
}

return M
