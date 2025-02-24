return {
  {
    'f-person/auto-dark-mode.nvim',
    priority = 99999,
    lazy = false,
    -- workaround for https://github.com/f-person/auto-dark-mode.nvim/issues/17
    init = function()
      local current_hour = tonumber(os.date '%H')

      if current_hour >= 7 and current_hour < 16 then
        vim.opt.background = 'light'
      else
        vim.opt.background = 'dark'
      end
    end,
    opts = {},
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
  },
  {
    'rockyzhang24/arctic.nvim',
    branch = 'v2',
    dependencies = { 'rktjmp/lush.nvim' },
    lazy = true,
  },
}
