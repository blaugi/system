-- A small, portable Neovim config inspired by kickstart.nvim.
-- Plugin declarations live in lua/plugins.lua and use Neovim's built-in vim.pack.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use the terminal's palette instead of GUI truecolor highlights.
vim.opt.termguicolors = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.confirm = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>")

require("plugins")
vim.cmd.colorscheme("default")

-- Keep Neovim's main editing surfaces transparent so the terminal background
-- shows through. Reapply if a colorscheme changes later.
local function make_background_transparent()
  for _, group in ipairs({
    "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer",
    "LineNr", "FoldColumn", "MsgArea", "FloatBorder",
  }) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

make_background_transparent()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_background_transparent,
})
