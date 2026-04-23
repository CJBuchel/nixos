local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true

-- Whitespace
opt.list = true
opt.listchars = {
	tab = "→ ",
	trail = "·",
	nbsp = "␣",
	extends = "›",
	precedes = "‹",
}

-- Behaviour
opt.clipboard = "unnamedplus" -- system clipboard (fixes your copy/paste issue)
opt.undofile = true -- persistent undo history
opt.swapfile = false
opt.updatetime = 100
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
