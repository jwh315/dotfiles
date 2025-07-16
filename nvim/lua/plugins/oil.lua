-- File explorer that lets you edit your filesystem like a buffer
-- Provides a unique approach to file management by treating directories as editable buffers
-- Customizations: Shows hidden files, custom keymaps, and convenient access via '-' key
return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false, -- Disabled to avoid conflicts with tmux navigation
        ['<C-l>'] = false, -- Disabled to avoid conflicts with tmux navigation
        ['<M-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true, -- Show hidden files and directories
      },
    }

    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
  end,
}