-- VIM Configuration File
-- Author: Lodomo.dev
-- License: MIT

-- Set Number Column
vim.opt.number = true          -- Show Line Numbers
vim.opt.relativenumber = true  -- Show Relative Line Numbers

-- Set all tabs to 4 spaces
vim.opt.tabstop = 4            -- Sets width of tab when read 
vim.opt.softtabstop = 4        -- Sets width of tab when pressed
vim.opt.shiftwidth = 4         -- How far >> and << move text 
vim.opt.expandtab = true       -- Expand Tabs to Spaces

vim.opt.swapfile = false       -- No Swap Files
vim.opt.backup = false         -- No Backup Files
vim.opt.hlsearch = false       -- Do not highlight search
vim.opt.incsearch = true       -- 
vim.opt.termguicolors = true   -- True Color Support
vim.opt.scrolloff = 8          -- Scroll Offset, 8 lines from top/bottom
vim.opt.updatetime = 50        -- Update Time in Milliseconds
vim.opt.colorcolumn = "80"     -- Column to highlight at 80

vim.opt.cursorline = true      -- Highlight Current Line
vim.opt.cursorcolumn = true    -- Highlight Current Column

vim.opt.autoindent = true      -- Auto Indent
vim.opt.smartindent = true     -- Smart Indent
vim.cmd("set formatoptions+=cro") -- Keep Line Formatting
vim.opt.wrap = false -- No Wrap

-- Key Mappings
vim.g.mapleader = " " -- Leader Key
vim.keymap.set("i", "jj", "<ESC>") -- Map jj to <ESC>

-- Yank to System Clipboard
vim.api.nvim_set_keymap("v", "<leader>y", [["+y]], { noremap = true, silent = true })

-- Paste from System Clipboard
vim.api.nvim_set_keymap("n", "<leader>p", [["+p]], { noremap = true, silent = true })

-- Remove carriage returns on a paste from Windows.
vim.api.nvim_set_keymap("n", "<leader>m", [[:lua CleanCarriageReturns()<CR>]], { noremap = true, silent = true })

-- Split the window with leader | and -
vim.api.nvim_set_keymap("n", "<leader>|", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>-", ":split<CR>", { noremap = true, silent = true })

-- Move between splits with leader hjkl
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })

-- Keymaps Tied to Plugins For Quick Reference:
-- None-LS: <leader>gf - Format the current buffer
-- lsp-config: K - Hover over a symbol
--             gd - Go to definition
--             <leader>ca - Code Action
--             <leader>rn - Rename Symbol
-- NeoTree: <leader>n - Open NeoTree
--          <leader>bf - Open NeoTree with Buffers
-- Telescope: <leader>ff - Find Files
--            <leader>fg - Live Grep
-- Copilot: <C-l> - Accept Single Word

function CleanCarriageReturns()
    vim.cmd([[ %s/\r//g ]])
end
