-- Enable relative line numbers
vim.opt.relativenumber = true

-- Resume latest Telescope window
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Toggle NvimTree
vim.keymap.set('n', '<leader>e', require('nvim-tree').toggle, { desc = 'Toggle File [E]xplorer' })

-- Keymaps for moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Move to below split' })
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Move to above split' })
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Move to right split' })

-- Keymaps for moving beween open buffers
vim.keymap.set('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { desc = 'Move to previous buffer' })
vim.keymap.set('n', '<S-l>', '<Cmd>BufferNext<CR>', { desc = 'Move to next buffer' })

-- Keymap for toggling the Telescope file browser
vim.keymap.set('n', '<leader>se', '<Cmd>Telescope file_browser<CR>', { desc = '[S]earch [F]ile [E]xplorer' })

-- Keymaps for ToggleTerm
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = 'Enter terminal normal mode' })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Enter terminal normal mode' })

-- Keymaps for Trouble
vim.keymap.set('n', '<leader>tt', '<Cmd>TroubleToggle<CR> ', { desc = '[T]oggle [T]rouble list' })

vim.keymap.set('n', '<leader>c', '<Cmd>BufferClose<CR> ', { desc = '[C]lose Buffer' })

vim.keymap.set('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR> ',
	{ desc = 'Open [T]erminal in [F]loating split' })
vim.keymap.set('n', '<leader>tv', '<Cmd>ToggleTerm size=80 direction=vertical<CR> ',
	{ desc = 'Open [T]erminal in [V]ertical split' })
vim.keymap.set('n', '<leader>th', '<Cmd>ToggleTerm size=10 direction=horizontal<CR> ',
	{ desc = 'Open [T]erminal in [H]orizontal split' })

vim.keymap.set('n', '<leader>q', '[[<C-w>q]] ', { desc = '[Q]uit current window' })

-- Map jj and jk to Escape
vim.keymap.set('i', 'jk', '<Esc>')


-- Move lines and blocks
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)

vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)


-- vim.keymap.set('n', '<leader>y', '[["+y]]', { desc = '[Y]ank to system clipboard' })
-- vim.keymap.set('n', '<leader>p', '[["+p]]', { desc = '[P]ast from system clipboard' })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})


require('lint').linters.clippy = {
	cmd = "cargo",
	stdin = false,
	args = { "clippy" },
	stream = "both",
	parser = require('lint.parser').from_errorformat(errorformat),
	ignore_exitcode = false,
	env = nil,
}

require('lint').linters_by_ft = {
	rust = { 'clippy', }
}
