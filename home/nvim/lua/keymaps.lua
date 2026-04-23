local map = vim.keymap.set

-- Clear search highlight with Escape
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- File tree (Ctrl+B like Zed)
map("n", "<C-b>", ":Neotree toggle<CR>", { silent = true })

-- Fuzzy find (Ctrl+P like most editors)
map("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })

-- Live grep (Space+F+G like Zed)
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })

-- Git panel (Ctrl+G like Zed)
map("n", "<C-g>", ":Neogit<CR>", { silent = true })

-- Buffer switching
map("n", "<Tab>", ":bnext<CR>", { silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { silent = true })
map("n", "<leader>x", ":bdelete<CR>", { silent = true })

-- Move lines up/down with Alt+Arrow (exactly like Zed)
map("n", "<A-Down>", ":m .+1<CR>==", { silent = true })
map("n", "<A-Up>", ":m .-2<CR>==", { silent = true })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })

-- Indenting with Tab/Shift+Tab in visual mode (like Zed)
map("v", "<Tab>", ">gv", { silent = true })
map("v", "<S-Tab>", "<gv", { silent = true })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })

-- Save
map("n", "<C-s>", ":w<CR>", { silent = true })
map("i", "<C-s>", "<Esc>:w<CR>", { silent = true })

-- Better up/down on wrapped lines
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })
