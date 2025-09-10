return {
  'augmentcode/augment.vim',
  cond = function()
    local cwd = vim.fn.expand '%:p:h'
    local work_dir = vim.fn.expand '~' .. '/work'
    return vim.g.vscode == nil and not cwd:find(work_dir, 1, true)
  end,
  config = function()
    local function get_workspace_config()
      local cwd = vim.fn.getcwd()

      if not vim.startswith(cwd, vim.fn.expand '~/personal') then
        return {}
      end

      local workspace_configs = {
        ['WPF%-ActivityLogger'] = { '~/personal/active/Unity-FutureCube/' },
      }

      for pattern, workspace in pairs(workspace_configs) do
        if string.find(cwd, pattern) then
          return workspace
        end
      end

      return { cwd }
    end

    local workspace_folders = get_workspace_config()
    vim.g.augment_workspace_folders = workspace_folders
  end,
}
