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
  end,
}