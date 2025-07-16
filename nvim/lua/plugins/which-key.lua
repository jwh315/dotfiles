-- Displays available keybindings in popup when you start typing a command
-- Helps discover and remember key mappings by showing them in a helpful popup
-- Customization: Includes spell check and git mappings for enhanced discoverability
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>z'] = { name = '[Z] Spell', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G] Git', _ = 'which_key_ignore' },
    }

    -- Register spell check mappings under leader
    require('which-key').register({
      ['<leader>z='] = { 'z=', 'Spell suggestions' },
      ['<leader>zg'] = { 'zg', 'Add word to dictionary' },
      ['<leader>zw'] = { 'zw', 'Mark word as wrong' },
      ['<leader>zug'] = { 'zug', 'Undo add word' },
      ['<leader>zuw'] = { 'zuw', 'Undo mark word' },
      ['<leader>zn'] = { ']s', 'Next misspelled word' },
      ['<leader>zp'] = { '[s', 'Previous misspelled word' },
    }, {
      mode = 'n',
      buffer = nil,
      silent = true,
      noremap = true,
    })

    -- Register git mappings using gitsigns functions
    require('which-key').register({
      ['<leader>gb'] = { function() require('gitsigns').blame_line() end, 'Git blame line' },
      ['<leader>gB'] = { function() require('gitsigns').blame_line { full = true } end, 'Git blame line (full)' },
      ['<leader>gd'] = { function() require('gitsigns').diffthis() end, 'Git diff this' },
      ['<leader>gD'] = { function() require('gitsigns').diffthis('~') end, 'Git diff this (cached)' },
      ['<leader>gp'] = { function() require('gitsigns').preview_hunk() end, 'Git preview hunk' },
      ['<leader>gr'] = { function() require('gitsigns').reset_hunk() end, 'Git reset hunk' },
      ['<leader>gR'] = { function() require('gitsigns').reset_buffer() end, 'Git reset buffer' },
      ['<leader>gs'] = { function() require('gitsigns').stage_hunk() end, 'Git stage hunk' },
      ['<leader>gS'] = { function() require('gitsigns').stage_buffer() end, 'Git stage buffer' },
      ['<leader>gu'] = { function() require('gitsigns').undo_stage_hunk() end, 'Git undo stage hunk' },
      ['<leader>gn'] = { function() require('gitsigns').next_hunk() end, 'Git next hunk' },
      ['<leader>gN'] = { function() require('gitsigns').prev_hunk() end, 'Git previous hunk' },
      ['<leader>gt'] = { function() require('gitsigns').toggle_current_line_blame() end, 'Git toggle blame' },
    }, {
      mode = 'n',
      buffer = nil,
      silent = true,
      noremap = true,
    })

    -- Register git mappings for visual mode
    require('which-key').register({
      ['<leader>gs'] = { function() require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Git stage hunk' },
      ['<leader>gr'] = { function() require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Git reset hunk' },
    }, {
      mode = 'v',
      buffer = nil,
      silent = true,
      noremap = true,
    })
  end,
}