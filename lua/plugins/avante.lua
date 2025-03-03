return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
  cond = function()
    local cwd = vim.fn.expand '%:p:h'
    local work_dir = vim.fn.expand '~' .. '/work'
    return vim.g.vscode == nil and not cwd:find(work_dir, 1, true)
    -- return vim.g.vscode == nil and not cwd:find(work_dir, 1, true) and false -- temporarily disabled. remove false
  end,
  opts = {
    hints = { enabled = true },
    provider = 'openrouter', -- or "copilot", "gemini", "ollama", "openrouter"
    vendors = {
      openrouter = {
        __inherited_from = 'openai',
        endpoint = 'https://openrouter.ai/api/v1',
        api_key_name = 'OPENROUTER_API_KEY',
        model = 'anthropic/claude-3.7-sonnet',
        max_tokens = 8192,
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = false,
    },
    copilot = {
      model = 'claude-3.7-sonnet', -- or "gpt-4o"
      temperature = 0,
      max_tokens = 8192,
    },
    gemini = {
      model = 'gemini-2.0-flash', -- or "gemini-1.5-pro", "gemini-2.0-flash-exp", "gemini-exp-1206", "gemini-1.5-flash", "gemini-2.0-flash-exp", "gemini-2.0-flash-thinking-exp-01-21"
      temperature = 0,
      max_tokens = 8192,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
