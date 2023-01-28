return function(use)
  use({
    'folke/which-key.nvim',
    config = function() require('which-key').setup({}) end
  })
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  use({ 'nvim-telescope/telescope-file-browser.nvim' })
  use({ 'nvim-tree/nvim-tree.lua', config = function()
    require('nvim-tree').setup()
  end,
    requires = {
      'nvim-tree/nvim-web-devicons' -- optional, for file icons
    }
  })
  use({ 'mrjones2014/smart-splits.nvim', config = function()
    require('smart-splits').setup({})
  end
  })
  use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function() require('toggleterm').setup() end
  }
  use({ 'rebelot/kanagawa.nvim', config = function()
    require('kanagawa').setup({
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = true },
      specialReturn = true, -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      globalStatus = false, -- adjust window separators highlight for laststatus=3
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {},
      overrides = {},
      theme = "default" -- Load "default" theme or the experimental "light" theme
    })

  end })
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end
  }
  use { 'stevearc/dressing.nvim' }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = function() require 'octo'.setup() end
  }
  use({ 'simrat39/inlay-hints.nvim', config = function()
    require('inlay-hints').setup()
  end })
  use({ 'simrat39/rust-tools.nvim' })
  use({
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup({
        floating_window = true,
        hint_prefix = '',
        max_height = 30,
        max_width = 140,
        doc_lines = 15,
        hint_enable = false,
        toggle_key = '<M-x>'
      })
    end
  })
  use({ 'rust-lang/rust.vim' })
  use({ 'folke/lsp-colors.nvim', config = function()
    require('lsp-colors').setup()
  end
  })
  use {
    'mcchrish/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = 'rktjmp/lush.nvim'
  }
  -- Render the lines for the current context
  use({ 'lukas-reineke/indent-blankline.nvim', config = function()
    require('indent_blankline').setup {
      show_current_context = true,
    }
  end })
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig', config = function()
    require('nvim-navic').setup {
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      },

      highlight = false,
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true
    }

  end }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  }
  use 'fedepujol/move.nvim'
  use 'mfussenegger/nvim-lint'
end
