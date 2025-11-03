-- Inicialización del gestor de plugins Lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
})

