local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" }
  
  -- Load only when require
  use { "nvim-lua/plenary.nvim", module = "plenary" }
  use "nvim-lua/popup.nvim"

  use { "BurntSushi/ripgrep" }
  
  --Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'}
    }
  }

  -- Better icons
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }

  -- Better Comment
  use {
    "numToStr/Comment.nvim",
    opt = true,
    keys = { "gc", "gcc", "gbc" },
    config = function()
      require("Comment").setup {}
    end,
  }

  -- Easy hopping
  use {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopChar1" },
    config = function()
      require("hop").setup {}
    end,
  }

  -- Easy motion
  use {
    "ggandor/lightspeed.nvim",
    keys = { "s", "S", "f", "F", "t", "T" },
    config = function()
      require("lightspeed").setup {}
    end,
  }
  
  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  }

  -- Colorscheme
  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd "colorscheme gruvbox-material"
    end,
  }

  use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      config = function()
      require("config.lualine").setup()
      end,
      requires = { "nvim-web-devicons" },
  }

  -- WhichKey
   use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
          require("config.whichkey").setup()
      end,
  }

  -- Buffer line
  use {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    config = function()
      require("config.bufferline").setup()
    end,
  }

  -- Startup screen
  use {
    "goolord/alpha-nvim",
    config = function()
      require("config.alpha").setup()
    end,
  }
  
  -- Git
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("config.neogit").setup()
    end,
  }
  
  -- Better Netrw
  use {"tpope/vim-vinegar"}

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp").setup()
    end,
    requires = {
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completeions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp-signature-help"
    }
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  
  -- Lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  use "OmniSharp/omnisharp-vim"
  use "mg979/vim-visual-multi"

  use {
    "voldikss/vim-floaterm", 
    commit = "e3f2d94d722603f8b65088ea1d7e0329951985bd",
  }

  -- use "mfussenegger/nvim-dap"
  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    -- opt = true,
    -- event = "BufReadPre",
    -- keys = { [[<leader>d]] },
    -- module = { "dap" },
    -- wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    -- requires = {
    --   -- "alpha2phi/DAPInstall.nvim",
    --   -- { "Pocco81/dap-buddy.nvim", branch = "dev" },
    --   "theHamsta/nvim-dap-virtual-text",
    --   "rcarriga/nvim-dap-ui",
    --   "mfussenegger/nvim-dap-python",
    --   "nvim-telescope/telescope-dap.nvim",
    --   { "leoluz/nvim-dap-go", module = "dap-go" },
    --   { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    -- },
  }

  use "vim-test/vim-test"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
