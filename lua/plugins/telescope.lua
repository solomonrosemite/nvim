return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = 'master',
  cond = vim.g.vscode == nil,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires special font.
    --  If you already have a Nerd Font, or terminal set up with fallback fonts
    --  you can enable this
    -- { 'nvim-tree/nvim-web-devicons' }
  },
  config = function()
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    local open_man_in_current_window = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      vim.cmd('tab Man ' .. selection.value)
    end

    local open_help_in_current_window = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      vim.cmd('tab help ' .. selection.value)
    end

    require('telescope').setup {
      defaults = {
        hidden = true,
        no_ignore = true,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '-u',
          '--glob',
          '!{**/.git/*,**/.svelte-kit/*,**/target/*,**/node_modules/*,**/.dist/*,**/dist/*,**/.trash/*,**/.obsidian/*,**/.next/*,**/.vercel/*}',
          '--sort',
          'path',
        },
      },
      pickers = {
        diagnostics = {
          wrap_results = true,
        },
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          hidden = true,
          no_ignore = true,
          find_command = {
            'rg',
            '--files',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '-u',
            '--glob',
            '!{**/.git/*,**/.svelte-kit/*,**/target/*,**/node_modules/*,**/.dist/*,**/dist/*,**/.trash/*,**/.obsidian/*,**/.next/*,**/.vercel/*}',
            '--sort',
            'path',
          },
        },
        help_tags = {
          mappings = {
            i = {
              ['<CR>'] = open_help_in_current_window,
            },
          },
        },
        man_pages = {
          mappings = {
            i = {
              ['<CR>'] = open_man_in_current_window,
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>p', builtin.find_files)
    vim.keymap.set('n', '<leader>k', builtin.live_grep)
    vim.keymap.set('n', '<leader>m', builtin.marks)
    vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = 'Search Help' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    -- vim.keymap.set(
    --   'n',
    --   '<leader>sd',
    --   "<cmd>lua require('telescope.builtin').diagnostics({wrap_results=true,initial_mode='normal'})<CR>",
    --   { desc = '[S]earch [D]iagnostics' }
    -- ) -- builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find existing buffers' })
    vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = '[C]hange [S]cheme' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
