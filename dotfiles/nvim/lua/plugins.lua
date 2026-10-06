vim.pack.add { 
  'https://github.com/ollykel/v-vim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/saghen/blink.lib',
  'https://github.com/alaviss/nim.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/folke/trouble.nvim',
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/jiaoshijie/undotree',
  'https://github.com/thePrimeagen/harpoon',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/nvim-orgmode/orgmode',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mfussenegger/nvim-lint',
  'https://github.com/akinsho/org-bullets.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/brenoprata10/nvim-highlight-colors',
  'https://github.com/antosha417/nvim-lsp-file-operations',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
}

-- vlang
--vim.lsp.config.vlang.setup({})

-- oil
require("oil").setup({ default_file_explorer = true,
  columns = {},
  keymaps = {
    ["q"] = "actions.close",
  },
  delete_to_trash = true,
  view_options = {
    show_hidden = true,
  },
  skip_confirm_for_simple_edits = true,
})
vim.keymap.set("n", "<leader>fm", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- harpoon
vim.keymap.set("n", "<leader>ad", function()
  harpoon:list():add()
end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- mason
require("mason").setup({
  opts = {
    ui = {
      icons = {
        package_installed = "*",
        package_pending = ">",
        package_uninstalled = "x"
      }
    }
  }
})

-- autopairs
require("nvim-autopairs").setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})

-- lspconfig
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  }
}

-- Color highlighting (the older nvim-colorizer.lua uses deprecated APIs).
require("nvim-highlight-colors").setup({ render = "background" })

-- mason-lspconfig
require("mason-lspconfig").setup()
